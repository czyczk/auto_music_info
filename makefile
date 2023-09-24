.PHONY: all

all: run

build_runner:
	@echo Running build_runner...
	@dart run build_runner build --delete-conflicting-outputs

compile: build_runner
	@echo Building...
	@flutter build windows

run: build_runner
	@echo Launching...
	@flutter run
