docker run -d --name my-firefox \
	--network my-net \
	-p 4444:4444 \
	-p 7900:7900 \
	-v ~/data:/home/seluser/data \
	--shm-size="2g" \
       	selenium/standalone-firefox:90.0-geckodriver-0.29-grid-4.0.0-rc-1-prerelease-20210713
