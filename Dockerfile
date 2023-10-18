FROM public.ecr.aws/lambda/nodejs:18 AS builder

# Do everything (test, lint, and build dist directory)
WORKDIR /opt/code
COPY . .
RUN npm run all

# Only need to push dist/ folder and node_modules/
FROM public.ecr.aws/lambda/nodejs:18
WORKDIR ${LAMBDA_TASK_ROOT}
COPY --from=builder /opt/code/dist/ .
COPY --from=builder /opt/code/node_modules/ node_modules
CMD [ "handler.handler" ]
