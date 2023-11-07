test:
	cd SpeedTester && docker build -t sambobbarnes/speedtester . && cd .. && docker compose up

test-d:
	cd SpeedTester && docker build -t sambobbarnes/speedtester . && cd .. && docker compose up -d

# Reporter
reporter-build:
	cd SpeedTestReporter && docker build -t sambobbarnes/speedtestreporter .
reporter-test:
	cd SpeedTestReporter && docker build -t sambobbarnes/speedtestreporter . && cd .. && docker compose up reporter
report:
	docker compose up reporter

# Speedtester
speedtester-build:
	cd SpeedTester && docker build -t sambobbarnes/speedtester .

speedtester-test:
	cd SpeedTester && docker build -t sambobbarnes/speedtester . && cd .. && docker compose up speedtester

speedtest:
	docker compose up speedtester