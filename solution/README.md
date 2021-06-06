1. Run the container image infracloudio/csvserver:latest in background and check if it's running.

$ docker run infracloudio/csvserver:latest
2021/06/04 09:01:23 error while reading the file "/csvserver/inputdata": open /csvserver/inputdata: no such file or directory
$

2. If it's failing then try to find the reason, once you find the reason, move to the next step.

for solving file not found, I did bind mounting

$ docker run -v /home/docker/interview/inputFile:/csvserver/inputdata infracloudio/csvserver:latest
2021/06/04 09:03:33 listening on ****

4. Run the container again in the background with file generated in (3) available inside the container (remember the reason you found in (2)).

$ docker run -d -v /home/cloud_user/csvserver_solution/solution/inputFile:/csvserver/inputdata infracloudio/csvserver:latest
cd52ed54335bf77f10e735b9ac70d14a72d4c16e79426c0662aed6596e5dfd76
$

5. Get shell access to the container and find the port on which the application is listening. Once done, stop / delete the running container.

$ docker exec cd52ed5 netstat -ltnp
Active Internet connections (only servers)
Proto Recv-Q Send-Q Local Address           Foreign Address         State       PID/Program name
tcp6       0      0 :::9300                 :::*                    LISTEN      1/csvserver
$


6. Same as (4), run the container and make sure,
        The application is accessible on the host at http://localhost:9393
        Set the environment variable CSVSERVER_BORDER to have value Orange.

docker run -d -v /home/cloud_user/csvserver_solution/solution/inputFile:/csvserver/inputdata -p 9393:9300 -e CSVSERVER_BORDER=Orange infracloudio/csvserver:latest
