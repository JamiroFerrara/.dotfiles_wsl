#!/bin/bash
user_input="$*"
bucket_name="stiwie-personal"

aws --endpoint-url https://s3.wasabisys.com/ --no-verify-ssl s3 cp $user_input s3://$bucket_name/
aws --endpoint-url https://s3.wasabisys.com/ --no-verify-ssl s3 presign s3://$bucket_name/$user_input
