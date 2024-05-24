# MIPS Assembly Homework Assignments

This repository contains two MIPS assembly language assignments focused on text processing and binary search trees. These assignments are part of the course on computer organization.

## Overview

The assignments consist of two separate tasks:
1. Implementing a text processing function to find and replace certain character sequences.
2. Working with a binary search tree to search for specific nodes and find the heaviest node.

## Prerequisites

- Ensure you have the MARS (MIPS Assembler and Runtime Simulator) tool installed to simulate and run the MIPS assembly code.
- Familiarity with MIPS assembly language and register conventions.

## Task Descriptions

### Task 1: Ligatures

The goal of this task is to develop a function in MIPS assembly that processes a given string to find specific character sequences (`ff` and `fi`) and replace them with their uppercase equivalents (`FF` and `FI`). The function should return the number of replacements made.

#### Requirements

- Input: A string containing lowercase characters.
- Process: Replace occurrences of `ff` and `fi` with `FF` and `FI` respectively.
- Output: The number of replacements made.

#### Example

- Input: `"Waffeleisen"`
  - Output: `"WaFFeleisen"`, Return value: `1`
- Input: `"Goldfische empfinden Hoffnung."`
  - Output: `"GoldFIsche empFInden HoFFnung."`, Return value: `3`

### Task 2: Animals in a Binary Search Tree

This task involves working with a binary search tree where each node represents an animal. The nodes are sorted alphabetically by animal names. The task has two parts:

#### Part 1: Alphabetical Search

Implement a function to search for an animal by its name in the binary search tree and return its weight.

#### Part 2: Heaviest Animal

Implement a function to traverse the binary search tree and find the heaviest animal.

#### Requirements

- **Part 1: Alphabetical Search**
  - Input: Root node of the tree, animal name.
  - Process: Search for the animal by its name using the properties of the binary search tree.
  - Output: Weight of the animal if found, otherwise `0`.

- **Part 2: Heaviest Animal**
  - Input: Root node of the tree.
  - Process: Traverse the entire tree to find the heaviest animal.
  - Output: Name of the heaviest animal.

#### Example

- Input Tree Structure:
  ```
      Katze
     /    \
  Amsel   Elefant
           /    \
      Goldfisch  Hund
  ```
  - Search for `"Hund"`: Returns weight of `"Hund"`.
  - Find heaviest animal: Returns `"Elefant"` if it's the heaviest.

## Usage

1. Clone the repository.
2. Open MARS and load the respective MIPS assembly file for each task.
3. Run the simulation to test the functions with provided and custom input values.
