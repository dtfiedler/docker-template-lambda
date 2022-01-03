# What is this?

Here you can find template for AWS Lambda written in TS and compiled into a Docker image.

To build project you need to type:
`npm run all`
Build process consists of:
  - linting project (TSLint)
  - running tests
  - generating js files (tsc) into `dist/` directory
  - trimming node_modules to production only (reduces image size)
  
# Packaging

Run `npm run docker:build` to build the latest image of this lambda.

# Testing Locally

Run `npm run docker:start` to build and run the lambda locally. You can then invoke the lambda via:

> curl -XPOST "http://localhost:9000/2015-03-31/functions/function/invocations" -d {}

# Deployments

TODO