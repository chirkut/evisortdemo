aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin 514010966842.dkr.ecr.us-west-2.amazonaws.com
docker build -t demo-reg .
docker tag demo-reg:latest 514010966842.dkr.ecr.us-west-2.amazonaws.com/demo-reg:latest
docker push 514010966842.dkr.ecr.us-west-2.amazonaws.com/demo-reg:latest
