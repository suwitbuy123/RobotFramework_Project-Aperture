# Robot Framework Project for API and UI Testing

This repository contains test automation scripts for API and UI testing using Robot Framework. The tests are designed to demonstrate API interactions and simulate user workflows on a web application.

---

## **Setup Instructions**

### **1. Install Python**

Ensure Python (version 3.10 or later) is installed on your system.

- Check Python version:
  ```bash
  python --version
  ```

### **2. Set up a Virtual Environment**

1. Create a virtual environment:

   ```bash
   python3 -m venv venv
   ```

2. Activate the virtual environment:

   - On macOS/Linux:

   ```bash
   source venv/bin/activate
   ```

   - On Windows

   ```bash
   venv\Scripts\activate
   ```

3. Install Dependencies
   - Run the following command to install required libraries:
   ```bash
   pip install robotframework robotframework-requests robotframework-seleniumlibrary
   ```

---

### **Running Tests**

1.  API Tests

    - To execute the API test cases, navigate to the `api_tests` folder and run:

    ```bash
    robot api_tests/tests/
    ```

2.  UI Tests
    - To execute the UI test cases, navigate to the `ui_tests` folder and run:
    ```bash
    robot ui_tests/tests/
    ```
3.  Combined Testing
    - To run all `API` and `UI` tests together:
    ```bash
    robot api_tests/tests/ ui_tests/tests/
    ```

---

## **Test Reports**

### **Viewing Test Results**

After executing the tests, Robot Framework generates the following files:

1. `output.xml`: The execution details in XML format.
2. `log.html`: A detailed log of the execution.
3. `report.html`: A summary report of the tests.

#### **To view the test results:**

1. Open the log.html file in any web browser to see a detailed breakdown of each test case.
2. Open the report.html file in any web browser to view a summary of passed/failed tests.

---

## **Project Details**

### **API Tests**

The API tests cover the following endpoints:

- GET /products
- POST /products
- PUT /products/{productId}
- DELETE /products/{productId}
- GET /products/categories

### **Command for API Tests**

Run all API test cases:

```bash
robot api_tests/tests/
```

### **UI Tests**

The UI tests simulate user actions on the Sauce Demo website:

- Login using multiple user credentials.
- Add products to the cart.
- Validate cart items.
- Proceed to checkout and validate the process.

### **Command for UI Testss**

Run all UI test cases:

```bash
robot ui_tests/tests/
```

---

## **Custom Keywords**

#### Custom reusable keywords are defined in the resources directory:

- API Testing: Located in `api_tests/resources/keywords.robot`
- UI Testing: Located in `ui_tests/resources/keywords.robot` and `ui_tests/resources/locators.robot`

#### These keywords simplify the test cases by abstracting repetitive actions.

---

## **Debugging Tips**

1. Headless Mode: If you want to observe the browser actions during UI tests, disable headless mode:

   ```bash
   Open Browser    ${BASE_URL}    chrome    options=--headless=False
   ```

2. Error Screenshots: The project captures screenshots automatically when errors occur. These screenshots are stored in the same directory as the logs (`selenium-screenshot-<number>.png`).

3. Retry Failed Tests: To re-run failed tests, use:
   ```bash
   robot --rerunfailed output.xml --output rerun.xml api_tests/tests/ ui_tests/tests/
   ```

---

## **Credits**

This project was built with:

- Robot Framework: Test automation framework.
- RequestsLibrary: For API testing.
- SeleniumLibrary: For UI automation.
- Sauce Demo Website: Sample web application for testing.
