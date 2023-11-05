build:
	cd SpeedTester && docker build -t sambobbarnes/speedtester .

test:
	cd SpeedTester && docker build -t sambobbarnes/speedtester . && cd .. && docker compose up

test-d:
	cd SpeedTester && docker build -t sambobbarnes/speedtester . && cd .. && docker compose up -d

run-test:
	cd SpeedTester && docker build -t sambobbarnes/speedtester . && cd .. && docker run -d --network="speedtest" --name=speedtest  sambobbarnes/speedtester