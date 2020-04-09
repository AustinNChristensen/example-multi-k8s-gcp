docker build -t enmotus/mutli-client:latest -t enmotus/multi-client:$SHA  -f ./client/Dockerfile ./client
docker build -t enmotus/mutli-server:latest -t enmotus/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t enmotus/mutli-worker:latest -t enmotus/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push enmotus/multi-client:$SHA
docker push enmotus/multi-client:latest

docker push enmotus/multi-server:$SHA
docker push enmotus/multi-server:latest

docker push enmotus/multi-worker:$SHA
docker push enmotus/multi-worker:latest

# kubectl apply -f ./k8s

# kubectl set image deployments/client-deployment client=enmotus/multi-client:$SHA
# kubectl set image deployments/server-deployment server=enmotus/multi-server:$SHA
# kubectl set image deployments/worker-deployment worker=enmotus/multi-worker:$SHA