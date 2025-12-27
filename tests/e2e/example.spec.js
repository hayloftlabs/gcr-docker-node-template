const { test, expect } = require("@playwright/test");

test.describe("example journey", () => {
  test("homepage renders", async ({ page }) => {
    test.skip(
      !process.env.E2E_BASE_URL,
      "Set E2E_BASE_URL (e.g., http://localhost:8080) to run E2E tests."
    );

    await page.goto("/");
    await expect(page.locator("body")).toBeVisible();
  });
});
