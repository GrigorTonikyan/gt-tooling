"""Tests for the SVG path parsing functionality."""

import pytest

from svg_toolkit.path import SVGCommand, parse_svg_path


def test_svg_command_validation():
    """Test SVG command validation."""
    # Valid command
    cmd = SVGCommand("M", [10.0, 20.0])
    assert cmd.to_dict() == {"M": [10.0, 20.0]}

    # Invalid command
    with pytest.raises(ValueError, match="Unknown SVG command"):
        SVGCommand("X", [10.0])

    # Invalid parameter count
    with pytest.raises(ValueError, match="Invalid number of parameters"):
        SVGCommand("M", [10.0])

    # Invalid arc flags
    with pytest.raises(ValueError, match="Invalid large-arc-flag"):
        SVGCommand("A", [10.0, 20.0, 30.0, 2.0, 0.0, 40.0, 50.0])

    with pytest.raises(ValueError, match="Invalid sweep-flag"):
        SVGCommand("A", [10.0, 20.0, 30.0, 0.0, 2.0, 40.0, 50.0])


def test_parse_svg_path():
    """Test parsing SVG path strings."""
    # Test simple path
    path = "M10 20L30 40"
    result = parse_svg_path(path)
    assert result == [{"M": [10.0, 20.0]}, {"L": [30.0, 40.0]}]

    # Test path with multiple command types
    path = "M10 20h30v40Z"
    result = parse_svg_path(path)
    assert result == [
        {"M": [10.0, 20.0]},
        {"h": [30.0]},
        {"v": [40.0]},
        {"Z": []},
    ]

    # Test path with arc command
    path = "M10 20A5 5 0 1 0 20 30"
    result = parse_svg_path(path)
    assert result == [
        {"M": [10.0, 20.0]},
        {"A": [5.0, 5.0, 0.0, 1.0, 0.0, 20.0, 30.0]},
    ]
