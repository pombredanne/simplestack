simplestack_cfg = etc/simplestack.cfg
simplestack_env = SIMPLESTACK_CFG=$(simplestack_cfg)

export simplestack_env

bin_pip         = pip
bin_python      = python
venv_dir        = .venv
venv_bin        = $(venv_dir)/bin

clean:
	@find . -name '*.pyc' -delete

pep:
	@$(venv_bin)/pep8 --repeat --show-source src setup.py

install_venv:
	$(bin_pip) install virtualenv

create_venv: install_venv
	virtualenv $(venv_dir)

bootstrap: create_venv
	$(venv_bin)/$(bin_pip) install -r pip-requires

test:
	@$(venv_bin)/nosetests $(TEST)

env:
	@echo $(simplestack_env)