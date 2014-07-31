<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
    </head>

    <body>

        <div id="page-body" role="main">

            <div class="nav" role="navigation">
                <h2 class="pull-left">
                    Create Deployment
                </h2>
                <div class="pull-right">
                    <div class="btn-group">
                        <button class="btn btn-primary">
                            Actions
                        </button>
                        <button class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
                            <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu pull-right">

                        </ul>
                    </div>
                </div>
            </div>

            <div id="app-deployment" class="content" role="main">

                <g:if test="${flash.message}">
                    <div class="alert alert-success fade in message" role="status">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                        ${flash.message}
                    </div>
                </g:if>

                <g:if test="${flash.error}">
                    <div class="alert alert-danger fade in message" role="status">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                        ${flash.error}
                    </div>
                </g:if>

                <g:form role="form" url="[controller: 'deployment', action: 'submit']" method="POST">

                    <div class="row">
                        <div class="form-group col-xs-8">
                            <div class="col-xs-3">
                                <label for="application">
                                    <g:message code="deployment.application.label" default="Application"/>
                                    <span class="required-indicator">*</span>
                                </label>
                            </div>
                            <div class="col-xs-4">
                                <g:select id="application" from="" name="application" class="form-control"
                                          noSelection="['':'-select an application-']" required=""/>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="form-group col-xs-8">
                            <div class="col-xs-3">
                                <label for="process">
                                    <g:message code="deployment.processes.label" default="Process"/>
                                    <span class="required-indicator">*</span>
                                </label>
                            </div>
                            <div class="col-xs-4">
                                <g:select id="process" from="" name="process" class="form-control"
                                          noSelection="['':'-select an application-']" required=""/>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="form-group col-xs-8">
                            <div class="col-xs-3">
                                <label for="environment">
                                    <g:message code="deployment.environment.label" default="Environment"/>
                                    <span class="required-indicator">*</span>
                                </label>
                            </div>
                            <div class="col-xs-4">
                                <g:select id="environment" from="" name="environment" class="form-control"
                                          noSelection="['':'-select an application-']" required=""/>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="form-group col-xs-8">
                            <div class="col-xs-3">
                                <label for="snapshot">
                                    <g:message code="deployment.snapshot.label" default="Snapshot"/>
                                </label>
                            </div>
                            <div class="col-xs-4">
                                <g:select id="snapshot" from="" name="snapshot" class="form-control"
                                          noSelection="['':'-select an environment-']" required=""/>
                            </div>
                        </div>
                    </div>


                    <div class="row">
                        <div class="col-xs-4">
                            <g:actionSubmit action="submit" class="save btn btn-success"
                                            value="${message(code: 'default.button.submit.label', default: 'Submit')}"/>
                        </div>
                    </div>
                </g:form>
            </div>

        </div>

        <script id="applications-template" type="text/x-handlebars-template">
            <option disabled></option>
            {{#this}}
            <option value="{{id}}">{{name}}</option>
            {{/this}}
        </script>

        <script id="processes-template" type="text/x-handlebars-template">
            <option disabled></option>
            {{#this}}
            <option value="{{id}}">{{name}}</option>
            {{/this}}
        </script>

        <script id="environments-template" type="text/x-handlebars-template">
            <option disabled></option>
            {{#this}}
            <option value="{{id}}">{{name}}</option>
            {{/this}}
        </script>

        <script id="snapshots-template" type="text/x-handlebars-template">
            <option disabled></option>
            {{#this}}
            <option value="{{id}}">{{name}}</option>
            {{/this}}
        </script>

        <asset:javascript src="app/radar-deployment.js"/>
        <script>
            $(document).ready(function () {
                var automationSettings = {
                    debug: true,
                    refreshInterval: ${session.refreshInterval}
                };
                RADAR.Deployment.init(automationSettings);
            });
        </script>
    </body>
</html>