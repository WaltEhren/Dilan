.PHONY: deps test train play play-gui play-human

LEVEL="snakeai/levels/15x15-blank.json"
WEIGHTS="models/attempt10/dqn-weights-15x15.model"

deps:
	python3.6 -m pip install --upgrade -r requirements.txt

test:
	PYTHONPATH=$(PYTHONPATH):. py.test snakeai/tests

train:
	./train.py --level $(LEVEL) --num-episodes 5

train-model:
	./train.py --level $(LEVEL) --num-episodes 5 --model $(WEIGHTS)

play:
	./play.py --interface cli --agent dqn --model ./models/dqn-final.model --level $(LEVEL) --num-episodes 100

play-gui:
	./play.py --interface gui --agent dqn --model ./models/dqn-final.model --level $(LEVEL) --num-episodes 10

play-human:
	./play.py --interface gui --agent human --level $(LEVEL) --num-episodes 1

# Files to modify for new attempt:
# parameters
