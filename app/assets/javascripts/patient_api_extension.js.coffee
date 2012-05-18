hQuery.Patient::procedureResults = -> this.results().concat(this.vitalSigns()).concat(this.procedures())
hQuery.Patient::laboratoryTests = -> this.results().concat(this.vitalSigns())
hQuery.Patient::allMedications = -> this.medications().concat(this.immunizations())
hQuery.Patient::allProblems = -> this.conditions().concat(this.socialHistories())
hQuery.Patient::allDevices = -> this.conditions().concat(this.procedures()).concat(this.careGoals()).concat(this.medicalEquipment())
hQuery.Patient::activeDiagnoses = -> this.conditions().concat(this.socialHistories()).withStatuses(['active'])
hQuery.Patient::inactiveDiagnoses = -> this.conditions().concat(this.socialHistories()).withStatuses(['inactive'])
hQuery.Patient::resolvedDiagnoses = -> this.conditions().concat(this.socialHistories()).withStatuses(['resolved'])
hQuery.CodedEntry::asIVL_TS = ->
  tsLow = new TS()
  tsLow.date = this.startDate() || this.timeStamp()
  tsHigh = new TS()
  tsHigh.date = this.endDate() || this.timeStamp()
  new IVL_TS(tsLow, tsHigh)