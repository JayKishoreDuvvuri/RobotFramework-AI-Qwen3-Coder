# Robot Framework Test Automation with Page Object Model

This project demonstrates a scalable test automation framework built using **Robot Framework** with the **Browser Library** and the **Page Object Model (POM)** design pattern. It automates tests for the e-commerce website: [https://shop.qaautomationlabs.com](https://shop.qaautomationlabs.com).

## 📁 Project Structure
```
robot_pom_framework/
.
├── README.md                           # Project overview, setup, and run instructions
├── requirements.txt                    # Python dependencies (robotframework, robotframework-browser, etc.)
├── results/                            # Output directory for test execution reports and logs
│   
├── resources/                          # Shared resources used by tests
│   └── pages/                          # Page Object Model definitions
│       ├── LoginPage.robot             # Keywords and locators specific to the Login page
│       ├── HomePage.robot              # Keywords and locators specific to the Home page
│       ├── CartPage.robot              # Keywords and locators specific to the Cart page
│       ├── CheckoutPage.robot          # Keywords and locators specific to the Checkout page
│       ├── ConfirmDetailsPage.robot    # Keywords and locators specific to the Confirm Details page
│       └── ThanksPage.robot            # Keywords and locators specific to the Thanks page
└── tests/                              # Contains the actual test case files
    └── e2e_test.robot                  # Test suite file containing your test cases (e.g., Login and E2E)
```

## 🛠️ Technologies Used

- **[Robot Framework](https://robotframework.org/)** – Keyword-driven test automation framework
- **[Browser Library](https://marketsquare.github.io/robotframework-browser/)** – Modern browser automation (based on Playwright)
- **Page Object Model (POM)** – Design pattern for maintainable UI tests
- **Python** – Backend language

## 📦 Prerequisites

Before running the tests, ensure you have the following installed:

- [Python 3.8 or higher](https://www.python.org/downloads/)
- [Node.js](https://nodejs.org/) (required by Browser Library)
- `pip` (Python package installer)

## 🚀 Setup Instructions

1. **Clone or extract the project**:
   ```bash
   git clone https://github.com/JayKishoreDuvvuri/RobotFramework-AI-Qwen3-Coder.git
   ```
## Install dependencies
   ```bash
- pip install -r requirements.txt - Install Python dependencies
- rfbrowser init
   ```

## Run the Tests
robot -d results tests/e2e_test.robot    

## Test Report
Open 'report.html' from 'results' Folder   