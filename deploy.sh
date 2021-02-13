docker build -t mbcatubig14/multi-client-10-14:latest -t mbcatubig14/multi-client-10-14:$SHA ./client
docker build -t mbcatubig14/multi-server-10-14:latest -t mbcatubig14/multi-server-10-14:$SHA ./server
docker build -t mbcatubig14/multi-worker-10-14:latest -t mbcatubig14/multi-worker-10-14:$SHA ./worker

docker push mbcatubig14/multi-client-10-14:latest
docker push mbcatubig14/multi-server-10-14:latest
docker push mbcatubig14/multi-worker-10-14:latest

docker push mbcatubig14/multi-client-10-14:$SHA
docker push mbcatubig14/multi-server-10-14:$SHA
docker push mbcatubig14/multi-worker-10-14:$SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=mbcatubig14/multi-server-10-14:$SHA
kubectl set image deployments/client-deployment client=mbcatubig14/multi-client-10-14:$SHA
kubectl set image deployments/worker-deployment worker=mbcatubig14/multi-worker-10-14:$SHA
