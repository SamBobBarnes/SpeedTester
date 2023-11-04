build:
	cd SpeedtestContainer && docker build -t sambobbarnes/speedtest .

test:
	cd SpeedtestContainer && docker build -t sambobbarnes/speedtest . && cd .. && docker compose up