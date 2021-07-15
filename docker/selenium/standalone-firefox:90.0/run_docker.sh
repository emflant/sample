docker run -d --name my-firefox \
	--network selenium-net \
	-p 4444:4444 \
	-p 7900:7900 \
	--shm-size="2g" \
       	selenium/standalone-firefox:90.0-geckodriver-0.29-grid-4.0.0-rc-1-prerelease-20210713
