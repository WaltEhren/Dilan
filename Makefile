.PHONY: deps test train play play-gui play-human

LEVEL="snakeai/levels/10x10-blank.json"

deps:
	python3.6 -m pip install --upgrade -r requirements.txt

test:
	PYTHONPATH=$(PYTHONPATH):. py.test snakeai/tests

train:
	./train.py --level $(LEVEL) --num-episodes 90000

train-model:


play:
	./play.py --interface cli --agent dqn --model ./models/dqn-final.model --level $(LEVEL) --num-episodes 100

play-gui:
	./play.py --interface gui --agent dqn --model ./models/dqn-final.model --level $(LEVEL) --num-episodes 10

play-human:
	./play.py --interface gui --agent human --level $(LEVEL) --num-episodes 1
