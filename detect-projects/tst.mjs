/* eslint-disable no-undef */
import { existsSync, lstatSync, readdirSync } from "fs";
import { join } from "path";
import { program } from "commander";
import {
  ignoreDirectories,
  projectRootFiles,
} from "../development/config.json";

program
  .argument("<path>", "The path to start searching from")
  .parse(process.argv);

const startPath = program.args[0];

if (existsSync(startPath) && lstatSync(startPath).isDirectory()) {
  walkDirectory(startPath);
} else {
  console.error("The provided path is not a directory");
}

function walkDirectory(dir) {
  try {
    const entries = readdirSync(dir, { withFileTypes: true });
    for (const entry of entries) {
      const entryPath = join(dir, entry.name);
      if (entry.isDirectory()) {
        if (ignoreDirectories.includes(entry.name)) {
          continue;
        }
        walkDirectory(entryPath);
      } else if (entry.isFile()) {
        if (isProjectRoot(entry.name)) {
          console.log(`Found project: ${dir}`);
          break;
        }
      }
    }
  } catch (e) {
    console.error(`Failed to read directory ${dir}: ${e.message}`);
  }
}

function isProjectRoot(fileName) {
  return projectRootFiles.includes(fileName);
}
