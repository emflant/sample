docker run -it --rm --name my-python-12 \
	-p 8888:8888 \
	-p 11434:11434 \
	-v ~/github/sample/python3/docs/llm:/myfiles/docs \
	-e OPENAI_TOKEN=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 \
	-w /myfiles/ \
	python-3.12 zsh
