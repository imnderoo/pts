<div class="fieldcontain ${hasErrors(bean: plateInstance, field: 'intPlateId', 'error')} required">

	<div class="row-fluid">
		<div class="span8">
			<div class="control-group">
				<label class="control-label" for="intPlateId">
					<g:message code="plate.intPlateId.label" default="Int Plate Prefix" />
					<span class="required-indicator">*</span>
				</label>
				<div class="controls">
					<g:textField class="input-small" name="intPlatePrefix" value="${params.intPlatePrefix}" required=""
						pattern="[a-zA-Z]{4}" maxlength="4" placeholder="4-letters" />
				</div>
			</div>

			<div class="fieldcontain ${hasErrors(bean: plateInstance, field: 'extPlateId', 'error')} required">
				<div class="control-group">

					<label class="control-label" for="extPlateId">
						<g:message code="plate.project.label" default="Ext Plate ID" />

					</label>
					<div class="controls">
						<g:textField class="input-medium" id="extPlateId" name="extPlateId" required="" value="${params.extPlateId}" />
					</div>
				</div>
			</div>

			<div class="fieldcontain ${hasErrors(bean: plateInstance, field: 'project', 'error')} required">
				<div class="control-group">

					<label class="control-label" for="project">
						<g:message code="plate.project.label" default="Project" />

					</label>
					<div class="controls">
						<g:select class="input-medium many-to-one" id="project" name="project.id" from="${pts.Project.list()}" optionKey="id"
							required="" value="${params.project?.id}" />
					</div>
				</div>
			</div>

			<div class="fieldcontain ${hasErrors(bean: plateInstance, field: 'createdDate', 'error')} required ">
				<div class="control-group">
					<label class="control-label" for="createdDate">
						<g:message code="plate.createdDate.label" default="Created Date" />
					</label>
					<div class="controls">
						<g:textField class="input-small datepicker" name="createdDate" value="${params.createdDate}" placeholder="DD-MM-YYYY" />
					</div>
				</div>
			</div>

			<div class="fieldcontain ${hasErrors(bean: plateInstance, field: 'enzymeUsed', 'error')} ">
				<div class="control-group">

					<label class="control-label" for="enzymeUsed">
						<g:message code="plate.enzymeUsed.label" default="Enzyme Used" />

					</label>
					<div class="controls">
						<g:select class="input-medium" name="enzymeUsed" from="${plateInstance.constraints.enzymeUsed.inList}"
							value="${plateInstance?.enzymeUsed}" valueMessagePrefix="plate.enzymeUsed" noSelection="['': '']" />
					</div>
				</div>
			</div>

			<div class="fieldcontain ${hasErrors(bean: plateInstance, field: 'pcrCondition', 'error')} ">
				<div class="control-group">

					<label class="control-label" for="pcrCondition">
						<g:message code="plate.pcrCondition.label" default="Pcr Condition" />

					</label>
					<div class="controls">
						<g:select class="input-medium" name="pcrCondition" from="${plateInstance.constraints.pcrCondition.inList}"
							value="${plateInstance?.pcrCondition}" valueMessagePrefix="plate.pcrCondition" noSelection="['': '']" />
					</div>
				</div>
			</div>

			<div class="fieldcontain ${hasErrors(bean: plateInstance, field: 'reactionSize', 'error')} ">
				<div class="control-group">

					<label class="control-label" for="reactionSize">
						<g:message code="plate.reactionSize.label" default="Reaction Size" />

					</label>
					<div class="controls">
						<g:select class="input-medium" name="reactionSize" from="${plateInstance.constraints.reactionSize.inList}"
							value="${plateInstance?.reactionSize}" valueMessagePrefix="plate.reactionSize" noSelection="['': '']" />
					</div>
				</div>
			</div>

			<div class="fieldcontain ${hasErrors(bean: plateInstance, field: 'chipId', 'error')} ">
				<div class="control-group">

					<label class="control-label" for="chipId">
						<g:message code="plate.chipId.label" default="Chip Id" />

					</label>
					<div class="controls">
						<g:textField class="input-small" name="chipId" value="${plateInstance?.chipId}" />
					</div>
				</div>
			</div>
		</div>
		<div class="span4">
			<table class="table table-bordered">
				<tr>
					<td>
						<h5>Quadrant 1:</h5>
						<g:textField id="q1Plate.name" name="q1Plate.name" pattern="^[a-zA-Z]{2}[0-9]{1,}" class="searchPlate96 input-medium"
							placeholder="Q1 PlateID" value="${params.q1Plate?.name}" required="" />
						<div class="fieldcontain ${hasErrors(bean: plateInstance, field: 'q1Plate', 'error')} required">
							<g:hiddenField id="q1Plate.id" name="q1Plate.id" class="searchPlate96Result" value="${params.q1Plate?.id}" />
						</div>

					</td>
					<td>
						<h5>Quadrant 2:</h5>
						<g:textField id="q2Plate.name" name="q2Plate.name" pattern="^[a-zA-Z]{2}[0-9]{1,}" class="searchPlate96 input-medium"
							placeholder="Q2 PlateID" value="${params.q2Plate?.name}" required="" />
						<div class="fieldcontain ${hasErrors(bean: plateInstance, field: 'q2Plate', 'error')} required">
							<g:hiddenField id="q2Plate.id" name="q2Plate.id" class="searchPlate96Result" value="${params.q2Plate?.id}" />
						</div>

					</td>
				</tr>
				<tr>
					<td>
						<h5>Quadrant 3:</h5>
						<g:textField id="q3Plate.name" name="q3Plate.name" pattern="^[a-zA-Z]{2}[0-9]{1,}" class="searchPlate96 input-medium"
							placeholder="Q3 PlateID" value="${params.q3Plate?.name}" required="" />
						<div class="fieldcontain ${hasErrors(bean: plateInstance, field: 'q3Plate', 'error')} required">
							<g:hiddenField id="q3Plate.id" name="q3Plate.id" class="searchPlate96Result" value="${params.q3Plate?.id}" />
						</div>

					</td>
					<td>
						<h5>Quadrant 4:</h5>
						<g:textField id="q4Plate.name" name="q4Plate.name" pattern="^[a-zA-Z]{2}[0-9]{1,}" class="searchPlate96 input-medium"
							placeholder="Q4 PlateID" value="${params.q4Plate?.name}" required="" />
						<div class="fieldcontain ${hasErrors(bean: plateInstance, field: 'q4Plate', 'error')} required">
							<g:hiddenField id="q4Plate.id" name="q4Plate.id" class="searchPlate96Result" value="${params.q4Plate?.id}" />
						</div>

					</td>
				</tr>
			</table>

		</div>
	</div>