.PHONY: test docs

test:
	python -m unittest discover tests/

coverage:
	PYTHONPATH=. coverage run --source datastorm setup.py test
	coverage html
	coverage report -m

clean:
	-rm -rf build
	-rm -rf datastorm.egg-info
	-rm -rf dist
	-rm -rf htmlcov
	-rm -rf docs/_build
	-rm docs/.nojekyll
	-rm .coverage

docs: coverage
	-rm docs/_static/coverage.svg
	coverage-badge -o docs/_static/coverage.svg
	cd docs && mkdocs build && touch .nojekyll

upload:
	python setup.py bdist_wheel
	twine upload dist/*
