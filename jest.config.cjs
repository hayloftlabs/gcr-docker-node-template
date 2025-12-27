/** @type {import('jest').Config} */
module.exports = {
  testEnvironment: "node",
  roots: ["<rootDir>/tests/unit"],
  setupFilesAfterEnv: [],
  collectCoverage: false,
  reporters: ["default"],
};
