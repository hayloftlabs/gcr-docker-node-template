const baseUrl = process.env.A11Y_BASE_URL || "http://localhost:8080";

module.exports = {
  defaults: {
    standard: "WCAG2AA",
    timeout: 30000,
    hideElements: [],
    runners: ["axe"],
  },
  urls: [`${baseUrl}/`],
};
