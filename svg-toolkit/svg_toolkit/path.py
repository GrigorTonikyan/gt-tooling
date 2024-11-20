"""SVG path parsing and manipulation utilities."""

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
