STACK_NAME=demo-lambda

build:
	sam build

deploy: build
	sam deploy --stack-name ${STACK_NAME} --resolve-s3 --capabilities CAPABILITY_IAM

clean:
	rm -rf .aws-sam && rm -rf venv


# LOCAL DEVELOPMENT

venv: venv/touchfile

init: venv
	test -d venv || python3 -m venv venv
	. venv/bin/activate; pip install -Ur src/requirements.txt
	touch venv/touchfile

run:
	source venv/bin/activate; \
	ENV=dev python src/lambda.py
