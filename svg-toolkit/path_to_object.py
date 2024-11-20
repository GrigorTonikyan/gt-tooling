import re
from dataclasses import dataclass
from typing import Dict, List, Optional


@dataclass
class SVGCommand:
    """Represents a single SVG path command with its parameters."""

    command: str
    params: List[float]

    def __post_init__(self):
        """Validates the command and parameters after initialization."""
        if self.command not in COMMANDS_PARAMS_COUNT:
            raise ValueError(f"Unknown SVG command: {self.command}")
        self.validate_params()

    def validate_params(self) -> None:
        """Validates the parameters for this SVG command."""
        params_per_segment = COMMANDS_PARAMS_COUNT[self.command]

        if params_per_segment == 0:
            if self.params:
                raise ValueError(f"Command {self.command} should not have parameters")
            return

        if len(self.params) % params_per_segment != 0:
            raise ValueError(
                f"Invalid number of parameters for command {self.command}: "
                f"expected multiples of {params_per_segment}, got {len(self.params)}"
            )

        if self.command.upper() == "A":
            self._validate_arc_command()

    def _validate_arc_command(self) -> None:
        """Validates the specific requirements for arc commands (A/a)."""
        params_per_segment = COMMANDS_PARAMS_COUNT[self.command]
        for i in range(0, len(self.params), params_per_segment):
            segment = self.params[i : i + params_per_segment]
            large_arc_flag = segment[3]
            sweep_flag = segment[4]

            if large_arc_flag not in (0.0, 1.0):
                raise ValueError(
                    f"Invalid large-arc-flag in command {self.command}: "
                    f"{large_arc_flag} (must be 0 or 1)"
                )
            if sweep_flag not in (0.0, 1.0):
                raise ValueError(
                    f"Invalid sweep-flag in command {self.command}: "
                    f"{sweep_flag} (must be 0 or 1)"
                )

    def to_dict(self) -> Dict[str, List[float]]:
        """Converts the command to a dictionary representation."""
        return {self.command: self.params}


# Constants for known SVG commands and their parameters per segment
COMMANDS_PARAMS_COUNT = {
    "M": 2,  # MoveTo requires pairs of coordinates (x, y)
    "m": 2,
    "L": 2,  # LineTo requires pairs of coordinates (x, y)
    "l": 2,
    "H": 1,  # Horizontal LineTo requires one coordinate (x)
    "h": 1,
    "V": 1,  # Vertical LineTo requires one coordinate (y)
    "v": 1,
    "C": 6,  # Cubic Bezier Curve requires six coordinates
    "c": 6,
    "S": 4,  # Smooth Cubic Bezier Curve requires four coordinates
    "s": 4,
    "Q": 4,  # Quadratic Bezier Curve requires four coordinates
    "q": 4,
    "T": 2,  # Smooth Quadratic Bezier Curve requires two coordinates
    "t": 2,
    "A": 7,  # Elliptical Arc requires seven parameters
    "a": 7,
    "Z": 0,  # ClosePath requires no parameters
    "z": 0,
}


def parse_svg_path(path: str) -> List[Dict[str, List[float]]]:
    """
    Parses an SVG path string into a structured format with validation.

    Args:
        path: A string containing SVG path data.

    Returns:
        A list of dictionaries, each containing a command character as key and its parameters as values.

    Raises:
        ValueError: If the path contains invalid commands or parameter counts.
    """
    commands: List[Dict[str, List[float]]] = []
    token_re = re.compile(
        r"""
        (?P<command>[MmLlHhVvCcSsQqTtAaZz])|       # Match a command
        (?P<number>
            -?                                      # Optional negative sign
            (?:
                \d+(?:\.\d+)?                       # Integer or decimal number
                |
                \.\d+                               # Decimal without leading digit
            )
            (?:[eE][+-]?\d+)?                       # Optional exponent
        )
    """,
        re.VERBOSE,
    )

    tokens = token_re.findall(path)
    current_command: Optional[str] = None
    params: List[float] = []

    for command_token, number_token in tokens:
        if command_token:
            if current_command is not None:
                cmd = SVGCommand(current_command, params)
                commands.append(cmd.to_dict())
                params = []
            current_command = command_token
            if current_command in ("Z", "z"):
                cmd = SVGCommand(current_command, [])
                commands.append(cmd.to_dict())
                current_command = None
        elif number_token:
            params.append(float(number_token))

    # Handle the last command
    if current_command is not None:
        cmd = SVGCommand(current_command, params)
        commands.append(cmd.to_dict())

    return commands


# Example
d = "M47 13a24 24 0 1 0-34 34 24 24 0 0 0 34-34Zm-2 32a21 21 0 1 1-30-30 21 21 0 0 1 30 30Zm-6-22-7 7 7 7v2h-2l-7-7-7 7h-2v-2l7-7-7-7v-2h2l7 7 7-7h2v2Z"

result = parse_svg_path(d)
from pprint import pprint

pprint(result)
