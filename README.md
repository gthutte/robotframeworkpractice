# robotframeworkpractice
##
## Environment Variables
##
#
# This project uses a .env file for secrets and environment-specific variables.
#
# 1. Copy .env.example to .env and fill in your values:
#    cp .env.example .env
# 2. NEVER commit your real .env file to version control.
# 3. Reference variables in your Robot Framework or Python code as needed.
#
# Example usage in Python:
#   from dotenv import load_dotenv; load_dotenv()
#   import os; os.getenv('TEST_BROWSER')
#
# Example usage in Robot Framework:
#   Variables    ${CURDIR}/.env
#
