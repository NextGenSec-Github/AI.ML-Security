# [Search Victim-Owned Websites](https://atlas.mitre.org/techniques/AML.T0003)

## Overview

Adversaries may search websites owned by the victim for information that can be used during targeting. Victim-owned websites may contain technical details about their machine learning (ML)-enabled products or services. These sites may include a variety of details, such as the names of departments/divisions, physical locations, and data about key employees, including names, roles, and contact information. Additionally, victim-owned websites may provide insights into business operations and relationships.

Adversaries leverage victim-owned websites to gather actionable information that helps tailor their attacks, such as Adversarial ML Attacks or Manual Modification. The information obtained from these sources may reveal opportunities for other forms of reconnaissance, such as searching for publicly available research materials or identifying adversarial vulnerability analysis.

## Mitigation

1. **Review and Restrict Information:** Regularly review the information publicly available on victim-owned websites and restrict sensitive details that could be exploited by adversaries.

2. **Monitor Website Activity:** Implement monitoring systems to detect unusual or unauthorized access to victim-owned websites.

3. **Educate Employees:** Train employees on responsible online behavior and the potential risks associated with publicly sharing sensitive information on company websites.

4. **Implement Access Controls:** Restrict access to certain sections of victim-owned websites to authorized personnel only.

5. **Limit Release of Public Information:** Limit the public release of technical information about the machine learning stack used in an organization's products or services. Technical knowledge of how machine learning is used can be leveraged by adversaries to perform targeting and tailor attacks to the target system. Additionally, consider limiting the release of organizational information - including physical locations, researcher names, and department structures - from which technical details such as machine learning techniques, model architectures, or datasets may be inferred.




By implementing these mitigation strategies, organizations can reduce the risk of adversaries using victim-owned websites for reconnaissance and targeted attacks.
