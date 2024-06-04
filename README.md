# Conway's Game of Life

This is a Ruby implementation of Conway's Game of Life, a classic cellular automaton devised by mathematician John Horton Conway. The game simulates the evolution of a grid of cells based on simple rules, creating fascinating patterns and behaviors.

## Installation

To run the simulation, you'll need to install the `ruby2d` gem. This gem provides a simple interface for creating 2D games and graphical applications in Ruby.

You can install `ruby2d` via the following command:
gem install ruby2d

## How Conway's Game of Life Works?

Conway's Game of Life takes place on an infinite two-dimensional grid of square cells. Each cell can be in one of two states: alive or dead. The game progresses in discrete time steps, or generations.

The rules for determining the state of each cell in the next generation are as follows:

1. **Underpopulation:** Any live cell with fewer than two live neighbors dies, as if by loneliness.
2. **Survival:** Any live cell with two or three live neighbors survives to the next generation.
3. **Overcrowding:** Any live cell with more than three live neighbors dies, as if by overcrowding.
4. **Reproduction:** Any dead cell with exactly three live neighbors becomes a live cell, as if by reproduction.

These rules are applied simultaneously to every cell in the grid. As a result, complex patterns can emerge from simple initial configurations.

## Controls

- **'P' Key:** Pressing the 'P' key toggles the simulation between playing and pausing. While playing, the simulation progresses through generations automatically.
- **'C' Key:** Pressing the 'C' key clears the grid, resetting all cells to the dead state. Additionally, it pauses the simulation if it's currently running.

## Author:
Sonit Bahl

