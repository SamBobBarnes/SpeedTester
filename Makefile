build:
	cd SpeedTester && docker build -t sambobbarnes/SpeedTester .

test:
	cd SpeedTester && docker build -t sambobbarnes/SpeedTester . && cd .. && docker compose up

test-d:
	cd SpeedTester && docker build -t sambobbarnes/SpeedTester . && cd .. && docker compose up -d