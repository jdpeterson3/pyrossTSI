PYTHON=python
#PYTHON=path to your python installation
path=examples
recursive=True

make:
	@echo Installing pyross...
	${PYTHON} setup.py install

clean-local:
	@echo removing local compiled files
	rm pyross/*.c pyross/*.html

clean:
	@echo removing all compiled files
	${PYTHON} setup.py clean
	rm pyross/*.c pyross/*.html
	
env:
	@echo creating conda environment...
	conda env create --file environment.yml
	# conda activate pyross
	@echo use make to install pyross

test:
	@echo testing pyross...
	cd tests && python quick_test.py

nbtest:
	@echo testing example notebooks...
	@echo test $(path)
	cd tests && python notebook_test.py --path $(path) --recursive $(recursive)
