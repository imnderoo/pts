package pts

import org.codehaus.groovy.grails.commons.DefaultGrailsDomainClassProperty
import org.codehaus.groovy.grails.commons.GrailsClass

class Plate {
	String intPlateId
	String extPlateId
	String reactionSize
	String enzymeUsed
	String pcrCondition
	String createdBy
	String chipId
	Date createdDate
	Plate q1Plate
	Plate q2Plate
	Plate q3Plate
	Plate q4Plate
	
	PlateType plateType // Many to one

	static hasMany = [samples: Sample]
	static notCloneable = ['q1Plate', 'q2Plate', 'q3Plate', 'q4Plate']	
	static belongsTo = [project: Project]
	
	static constraints = {
		project nullalbe: false

		intPlateId size: 1..8, blank: false, nullable: false, unique: true
		// ExtPlateId is not set to unique because we may test duplicates of the same plate (under different conditions)
		extPlateId size: 1..8, blank: false, nullable: false
		plateType nullable: false

		createdBy size: 1..24, nullable: false
		createdDate nullable: false

		q1Plate nullable: true
		q2Plate nullable: true
		q3Plate nullable: true
		q4Plate nullable: true
		
		enzymeUsed inList: ['Qiagen', 'Kappa'], nullable: true
		pcrCondition inList: ['Normal', '58C'], nullable: true
		reactionSize inList: ['Half', 'Full'], nullable: true

		chipId nullable: true
	}

	static mapping = { samples sort: 'well' }
	
	public String toString()
	{
		return intPlateId
	}

	static Object deepClone(domainInstanceToClone) {

		//Our target instance for the instance we want to clone
		// recursion
		def newDomainInstance = domainInstanceToClone.getClass().newInstance()

		//Returns a DefaultGrailsDomainClass (as interface GrailsDomainClass) for inspecting properties
		GrailsClass domainClass = domainInstanceToClone.domainClass.grailsApplication.getDomainClass(newDomainInstance.getClass().name)

		def notCloneable = domainClass.getPropertyValue("notCloneable")

		for(DefaultGrailsDomainClassProperty prop in domainClass?.getPersistentProperties()) {
			if (notCloneable && prop.name in notCloneable)
				continue

			if (prop.association) {

				if (prop.owningSide) {
					//we have to deep clone owned associations
					if (prop.oneToOne) {
						def newAssociationInstance = deepClone(domainInstanceToClone?."${prop.name}")
						newDomainInstance."${prop.name}" = newAssociationInstance
					} else {

						domainInstanceToClone."${prop.name}".each { associationInstance ->
							def newAssociationInstance = deepClone(associationInstance)

							if (newAssociationInstance)
								newDomainInstance."addTo${prop.name.capitalize()}"(newAssociationInstance)
						}
					}
				} else {

					if (!prop.bidirectional) {

						//If the association isn't owned or the owner, then we can just do a  shallow copy of the reference.
						newDomainInstance."${prop.name}" = domainInstanceToClone."${prop.name}"
					}
					// @@JR
					// Yes bidirectional and not owning. E.g. clone Report, belongsTo Organisation which hasMany
					// manyToOne. Just add to the owning objects collection.
					else {
						//println "${prop.owningSide} - ${prop.name} - ${prop.oneToMany}"
						//return
						if (prop.manyToOne) {

							newDomainInstance."${prop.name}" = domainInstanceToClone."${prop.name}"
							def owningInstance = domainInstanceToClone."${prop.name}"
							// Need to find the collection.
							String otherSide = prop.otherSide.name.capitalize()
							//println otherSide
							//owningInstance."addTo${otherSide}"(newDomainInstance)
						}
						else if (prop.manyToMany) {
							//newDomainInstance."${prop.name}" = [] as Set

							domainInstanceToClone."${prop.name}".each {

								//newDomainInstance."${prop.name}".add(it)
							}
						}

						else if (prop.oneToMany) {
							domainInstanceToClone."${prop.name}".each { associationInstance ->
								def newAssociationInstance = deepClone(associationInstance)
								newDomainInstance."addTo${prop.name.capitalize()}"(newAssociationInstance)
							}
						}
					}
				}
			} else {
				//If the property isn't an association then simply copy the value
				newDomainInstance."${prop.name}" = domainInstanceToClone."${prop.name}"

				if (prop.name == "dateCreated" || prop.name == "lastUpdated") {
					newDomainInstance."${prop.name}" = null
				}
			}
		}

		return newDomainInstance
	}
}
