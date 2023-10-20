create.project.mssql: check_project_nulity check_app_nulity check_target_existence
	@project_path=$(target)/$(project)_$(app) && \
		cp -r project.tmpl $${project_path} && \
		sed -i'' -e 's/SCHEMATIC__PROJECT_NAME/$(project)/g' $${project_path}/docker/config/project.env && \
		sed -i'' -e 's/SCHEMATIC__APP_NAME/$(app)/g' $${project_path}/docker/config/project.env && \
		rm -f $${project_path}/docker/config/project.env-e && \
		sed -i'' -e 's/SCHEMATIC__DB_ADAPTER/mssql/g' $${project_path}/docker/config/docker.env && \
		rm -f $${project_path}/docker/config/docker.env-e && \
		rm -fr $${project_path}/docker/config/psql && \
		rm -fr $${project_path}/docker/psql

create.project.psql: check_project_nulity check_app_nulity check_target_existence
	@project_path=$(target)/$(project)_$(app) && \
		cp -r project.tmpl $${project_path} && \
		sed -i'' -e 's/SCHEMATIC__PROJECT_NAME/$(project)/g' $${project_path}/docker/config/project.env && \
		sed -i'' -e 's/SCHEMATIC__APP_NAME/$(app)/g' $${project_path}/docker/config/project.env && \
		rm -f $${project_path}/docker/config/project.env-e && \
		sed -i'' -e 's/SCHEMATIC__DB_ADAPTER/psql/g' $${project_path}/docker/config/docker.env && \
		rm -f $${project_path}/docker/config/docker.env-e && \
		rm -fr $${project_path}/docker/config/mssql && \
		rm -fr $${project_path}/docker/mssql

check_project_nulity:
	@[ -z "$(project)" ] && \
		{ echo "Error! Project is NOT specified."; exit 1; } || \
		exit 0

check_app_nulity:
	@[ -z "$(app)" ] && \
		{ echo "Error! App path is NOT specified."; exit 1; } || \
		exit 0

check_target_nulity:
	@[ -z "$(target)" ] && \
		{ echo "Error! Target path is NOT specified."; exit 1; } || \
		exit 0

check_target_existence: check_target_nulity
	@[ -d "$(target)/$(project)_$(app)" ] && \
		{ echo "Error! Target path already exists: $(target)/$(project)-$(app)"; exit 1; } || \
		exit 0
