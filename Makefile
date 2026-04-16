.PHONY: test clean

RESULTS_DIR=Results

#test:
#	mkdir -p $(RESULTS_DIR)
#	robot --outputdir $(RESULTS_DIR) TestCases/*.robot

clean:
	rm -rf $(RESULTS_DIR)

#test-qa:
#	mkdir -p $(RESULTS_DIR)
#	PYTHONPATH=. robot --variable ENV_FILE:CustomVariables.variables_qa --outputdir $(RESULTS_DIR) TestCases/*.robot
#
#test-staging:
#	mkdir -p $(RESULTS_DIR)
#	PYTHONPATH=. robot --variable ENV_FILE:CustomVariables.variables_staging --outputdir $(RESULTS_DIR) TestCases/*.robot

test-qa:
	cp .env.qa .env
	mkdir -p $(RESULTS_DIR)
	PYTHONPATH=. robot --outputdir $(RESULTS_DIR) TestCases/*.robot

test-staging:
	cp .env.staging .env
	mkdir -p $(RESULTS_DIR)
	PYTHONPATH=. robot --outputdir $(RESULTS_DIR) TestCases/*.robot