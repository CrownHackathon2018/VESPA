class MastersController < ApplicationController
  before_action :set_master, only: [:show, :edit, :update, :destroy]

  # GET /masters
  # GET /masters.json
  def index
    @masters = Master.all
  end

  # GET /masters/1
  # GET /masters/1.json
  def show
  end

  # GET /masters/new
  def new
    @master = Master.new
  end

  # GET /masters/1/edit
  def edit
  end

  # POST /masters
  # POST /masters.json
  def create
    @master = Master.new(master_params)

    respond_to do |format|
      if @master.save
        format.html { redirect_to @master, notice: 'Master was successfully created.' }
        format.json { render :show, status: :created, location: @master }
      else
        format.html { render :new }
        format.json { render json: @master.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /masters/1
  # PATCH/PUT /masters/1.json
  def update
    respond_to do |format|
      if @master.update(master_params)
        format.html { redirect_to @master, notice: 'Master was successfully updated.' }
        format.json { render :show, status: :ok, location: @master }

        @vik_envs = VikEnv.all
        @vik_envs.each do |e|
          if @master.vikEnvironment = e.environment
            @vikDB = e.description
          end
        end

        @prom_envs = PromEnv.all
        @prom_envs.each do |e|
          if @master.promEnvironment = e.environment
            @promBD = e.description
    
          end
        end

        out_file = File.new("app/fileconfigs/VIK.exe.config", "w")
        out_file.puts(%Q[<?xml version="1.0" encoding="utf-8"?>
<configuration>
  <configSections>
    <section name="loggingConfiguration" type="Microsoft.Practices.EnterpriseLibrary.Logging.Configuration.LoggingSettings, Microsoft.Practices.EnterpriseLibrary.Logging, Version=5.0.505.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" requirePermission="true" />
    <section name="exceptionHandling" type="Microsoft.Practices.EnterpriseLibrary.ExceptionHandling.Configuration.ExceptionHandlingSettings, Microsoft.Practices.EnterpriseLibrary.ExceptionHandling, Version=5.0.505.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" requirePermission="true" />
    <section name="dataConfiguration" type="Microsoft.Practices.EnterpriseLibrary.Data.Configuration.DatabaseSettings, Microsoft.Practices.EnterpriseLibrary.Data, Version=5.0.505.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" requirePermission="true" />
    <section name="cachingConfiguration" type="Microsoft.Practices.EnterpriseLibrary.Caching.Configuration.CacheManagerSettings, Microsoft.Practices.EnterpriseLibrary.Caching, Version=5.0.505.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" requirePermission="true" />
  </configSections>
  <loggingConfiguration name="" tracingEnabled="true" defaultCategory="General">
    <listeners>
      <add name="Formatted EventLog TraceListener" type="Microsoft.Practices.EnterpriseLibrary.Logging.TraceListeners.FormattedEventLogTraceListener, Microsoft.Practices.EnterpriseLibrary.Logging, Version=5.0.505.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
        listenerDataType="Microsoft.Practices.EnterpriseLibrary.Logging.Configuration.FormattedEventLogTraceListenerData, Microsoft.Practices.EnterpriseLibrary.Logging, Version=5.0.505.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
        source="Enterprise Library Logging" formatter="Text Formatter"
        log="Application" />
      <add name="Rolling Flat File Trace Listener" type="Microsoft.Practices.EnterpriseLibrary.Logging.TraceListeners.RollingFlatFileTraceListener, Microsoft.Practices.EnterpriseLibrary.Logging, Version=5.0.505.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
        listenerDataType="Microsoft.Practices.EnterpriseLibrary.Logging.Configuration.RollingFlatFileTraceListenerData, Microsoft.Practices.EnterpriseLibrary.Logging, Version=5.0.505.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
        fileName="ExceptionLogs/VIK_Exceptions.log" formatter="Text Formatter" rollInterval="Day" rollSizeKB="10240" timeStampPattern="yyyy-MM-dd" maxArchivedFiles="10" />
      <add name="VIK4LogTranceListner" type="Microsoft.Practices.EnterpriseLibrary.Logging.Database.FormattedDatabaseTraceListener, Microsoft.Practices.EnterpriseLibrary.Logging.Database, Version=5.0.505.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
        listenerDataType="Microsoft.Practices.EnterpriseLibrary.Logging.Database.Configuration.FormattedDatabaseTraceListenerData, Microsoft.Practices.EnterpriseLibrary.Logging.Database, Version=5.0.505.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
        databaseInstanceName="VIK4Logs" writeLogStoredProcName="WriteLog"
        addCategoryStoredProcName="AddCategory" formatter="Text Formatter"
        traceOutputOptions="LogicalOperationStack, DateTime, Timestamp, ProcessId, ThreadId, Callstack" />
      <add name="Database Trace Listener" type="Microsoft.Practices.EnterpriseLibrary.Logging.Database.FormattedDatabaseTraceListener, Microsoft.Practices.EnterpriseLibrary.Logging.Database, Version=5.0.505.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
        listenerDataType="Microsoft.Practices.EnterpriseLibrary.Logging.Database.Configuration.FormattedDatabaseTraceListenerData, Microsoft.Practices.EnterpriseLibrary.Logging.Database, Version=5.0.505.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
        databaseInstanceName="LoggingDb" writeLogStoredProcName="WriteLog"
        addCategoryStoredProcName="AddCategory " formatter="Database Auditing Text Formatter"
        traceOutputOptions="None" filter="All" />
    </listeners>
    <formatters>
      <add type="Microsoft.Practices.EnterpriseLibrary.Logging.Formatters.TextFormatter, Microsoft.Practices.EnterpriseLibrary.Logging, Version=5.0.505.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
        template="Message: {message}{newline}" name="Text Formatter" />
      <add type="Microsoft.Practices.EnterpriseLibrary.Logging.Formatters.TextFormatter, Microsoft.Practices.EnterpriseLibrary.Logging, Version=5.0.505.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
        template="Title:{title}{newline}&#xA;Timestamp: {timestamp(local)}{newline}&#xA;Message: {message}{newline}"
        name="Auditing Text Formatter" />
      <add type="Microsoft.Practices.EnterpriseLibrary.Logging.Formatters.TextFormatter, Microsoft.Practices.EnterpriseLibrary.Logging, Version=5.0.505.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
        template="{message}"
        name="Database Auditing Text Formatter" />
    </formatters>
    <categorySources>
      <add switchValue="All" name="General" />
      <add switchValue="All" name="Trace">
        <listeners>
          <add name="Rolling Flat File Trace Listener" />
          <add name="Formatted EventLog TraceListener" />
        </listeners>
      </add>
      <add switchValue="All" name="VIKAuditing">
        <listeners>
          <add name="Database Trace Listener" />
        </listeners>
      </add>
    </categorySources>
    <specialSources>
      <allEvents switchValue="All" name="All Events" />
      <notProcessed switchValue="All" name="Unprocessed Category" />
      <errors switchValue="All" name="Logging Errors &amp; Warnings">
        <listeners>
          <add name="Formatted EventLog TraceListener" />
        </listeners>
      </errors>
    </specialSources>
  </loggingConfiguration>
  <exceptionHandling>
    <exceptionPolicies>
      <add name="CorePolicy">
        <exceptionTypes>
          <add name="Exception" type="System.Exception, mscorlib, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089" postHandlingAction="ThrowNewException">
            <exceptionHandlers>
              <add name="Trace Handler" type="Microsoft.Practices.EnterpriseLibrary.ExceptionHandling.Logging.LoggingExceptionHandler, Microsoft.Practices.EnterpriseLibrary.ExceptionHandling.Logging, Version=5.0.505.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" logCategory="Trace" eventId="100" severity="Error" title="VIK Exception Handling" formatterType="Microsoft.Practices.EnterpriseLibrary.ExceptionHandling.TextExceptionFormatter, Microsoft.Practices.EnterpriseLibrary.ExceptionHandling, Version=5.0.505.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" priority="0" useDefaultLogger="false" />
              <add name="Email Handler" type="Microsoft.Practices.EnterpriseLibrary.ExceptionHandling.Logging.LoggingExceptionHandler, Microsoft.Practices.EnterpriseLibrary.ExceptionHandling.Logging, Version=5.0.505.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" logCategory="Email" eventId="100" severity="Error" title="Enterprise Library Exception Handling" formatterType="Microsoft.Practices.EnterpriseLibrary.ExceptionHandling.TextExceptionFormatter, Microsoft.Practices.EnterpriseLibrary.ExceptionHandling, Version=5.0.505.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" priority="0" useDefaultLogger="false" />
              <add name="Replace Handler" type="Microsoft.Practices.EnterpriseLibrary.ExceptionHandling.ReplaceHandler, Microsoft.Practices.EnterpriseLibrary.ExceptionHandling, Version=5.0.505.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" exceptionMessage="Application error. Please advise GIS and provide them with this error code: {handlingInstanceID}" replaceExceptionType="Crown.VIK.Common.VIKException, Crown.VIK.Common, Version=0.2.0.0, Culture=neutral, PublicKeyToken=null" />
            </exceptionHandlers>
          </add>
        </exceptionTypes>
      </add>
    </exceptionPolicies>
  </exceptionHandling>
  <dataConfiguration defaultDatabase="VIKDb" />
  <connectionStrings>
    <add name="VIKDb" connectionString="Data Source=#{@vikDB};User Id=***;Password=***;Connect Timeout=30;pooling='true'; Max Pool Size=200;" providerName="System.Data.SqlClient" />
	  <add name="LoggingDb" connectionString="Data Source=SQL2014-TEST;Initial Catalog=VIK_Applogging;User Id=***;Password=***;Connect Timeout=30;pooling='true'; Max Pool Size=200;" providerName="System.Data.SqlClient" />
	  <add name="PromotionsDb" connectionString="Data Source=#{@promDB};User Id=***;Password=***;Connect Timeout=30;pooling='true'; Max Pool Size=200;" providerName="System.Data.SqlClient" />
  </connectionStrings>
  <cachingConfiguration defaultCacheManager="Cache Manager">
    <cacheManagers>
      <add name="Cache Manager" type="Microsoft.Practices.EnterpriseLibrary.Caching.CacheManager, Microsoft.Practices.EnterpriseLibrary.Caching, Version=5.0.505.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" expirationPollFrequencyInSeconds="60" maximumElementsInCacheBeforeScavenging="1000" numberToRemoveWhenScavenging="10" backingStoreName="NullBackingStore" />
    </cacheManagers>
    <backingStores>
      <add type="Microsoft.Practices.EnterpriseLibrary.Caching.BackingStoreImplementations.NullBackingStore, Microsoft.Practices.EnterpriseLibrary.Caching, Version=5.0.505.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" name="NullBackingStore" />
    </backingStores>
  </cachingConfiguration>
  <runtime>
    <assemblyBinding xmlns="urn:schemas-microsoft-com:asm.v1">
      <dependentAssembly>
        <assemblyIdentity name="Microsoft.Practices.EnterpriseLibrary.Logging" publicKeyToken="31bf3856ad364e35" culture="neutral" />
        <bindingRedirect oldVersion="0.0.0.0-5.0.505.0" newVersion="5.0.505.0" />
      </dependentAssembly>
      <dependentAssembly>
        <assemblyIdentity name="Microsoft.Practices.EnterpriseLibrary.Common" publicKeyToken="31bf3856ad364e35" culture="neutral" />
        <bindingRedirect oldVersion="0.0.0.0-5.0.505.0" newVersion="5.0.505.0" />
      </dependentAssembly>
      <dependentAssembly>
        <assemblyIdentity name="Microsoft.Practices.EnterpriseLibrary.Data" publicKeyToken="31bf3856ad364e35" culture="neutral" />
        <bindingRedirect oldVersion="0.0.0.0-5.0.505.0" newVersion="5.0.505.0" />
      </dependentAssembly>
      <dependentAssembly>
        <assemblyIdentity name="System.Windows.Interactivity" publicKeyToken="31bf3856ad364e35" culture="neutral" />
        <bindingRedirect oldVersion="0.0.0.0-4.0.0.0" newVersion="4.5.0.0" />
      </dependentAssembly>
      <dependentAssembly>
        <assemblyIdentity name="Microsoft.Owin" publicKeyToken="31bf3856ad364e35" culture="neutral" />
        <bindingRedirect oldVersion="0.0.0.0-3.0.1.0" newVersion="3.0.1.0" />
      </dependentAssembly>
	  <dependentAssembly>
	  	<assemblyIdentity name="Newtonsoft.Json" publicKeyToken="30ad4fe6b2a6aeed" culture="neutral" />
	  	<bindingRedirect oldVersion="0.0.0.0-9.0.0.0" newVersion="9.0.0.0" />
	  </dependentAssembly>
    </assemblyBinding>
  </runtime>
</configuration>])
        out_file.close
      else
        format.html { render :edit }
        format.json { render json: @master.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /masters/1
  # DELETE /masters/1.json
  def destroy
    @master.destroy
    respond_to do |format|
      format.html { redirect_to masters_url, notice: 'Master was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_master
      @master = Master.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def master_params
      params.require(:master).permit(:viknum, :vikEnvironment, :promEnvironment, :userID, :comment, :reqdt)
    end
end
