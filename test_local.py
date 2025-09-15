#!/usr/bin/env python3

import os
import sys
import json
from dotenv import load_dotenv
load_dotenv('local.env')

# Add the lambda directory to Python path
sys.path.insert(0, os.path.join(os.path.dirname(__file__), 'lambda', 'disaster_recovery'))

# Environment variables are now loaded from local.env

# Import the lambda function
from lambda_function import lambda_handler

# Test event for B2 mode
event = {
    "backup_date": "latest",
    "clear_existing_data": False,
    "dry_run": True,
    "max_workers": 5,
    "mode": "b2"
}

# Mock context
class MockContext:
    def __init__(self):
        self.function_name = 'test-function'
        self.aws_request_id = 'test-request-id'

if __name__ == "__main__":
    try:
        context = MockContext()
        result = lambda_handler(event, context)
        print(json.dumps(result, indent=2))
    except Exception as e:
        print(f"Error: {e}")
