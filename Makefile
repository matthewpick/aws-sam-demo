STACK_NAME=demo-lambda

build:
	sam build

deploy: build
	sam deploy --stack-name ${STACK_NAME} --resolve-s3 --capabilities CAPABILITY_IAM

clean:
	rm -f .aws-sam
