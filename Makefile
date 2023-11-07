test:
	cd SpeedTester && docker build -t sambobbarnes/speedtester . && cd .. && docker compose up

test-d:
	cd SpeedTester && docker build -t sambobbarnes/speedtester . && cd .. && docker compose up -d



# Speedtester
speedtester-build:
	cd SpeedTester && docker build -t sambobbarnes/speedtester .

speedtester-test:
	cd SpeedTester && docker build -t sambobbarnes/speedtester . && cd .. && docker compose up speedtester

speedtest:
	docker compose up speedtester