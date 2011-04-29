module ApplicationHelper

def women_options
t = [ "Pregnant", 
	  "Trying to get pregnant", 
	  "Nursing", 
	  "Taking oral contraceptives"
]
return t	
end

def health_options
t = [ "Health Level I - Emergency Care",
	  "Health Level II - Maintenance Care", 
	  "Health Level III - Comprehensive Care", 
	  "Health Level IV - Comprehensive & Cosmetic Care"
	]
end

def health_explain 
  [
	"I am only interested in emergency dental care for the relief of pain and/or cosmetic embarrassment. I am not very interested in thinking about the future of my teeth at this time.", 
	"I am interested in maintenance care by taking an active part in the prevention of the disease process and the repair of existing problems. However, I am not yet ready for a higher level of dental care due to limitations of time and/or money. I understand that maintenance care may not be enough to help me achieve maximum protection and longevity and that my dental health may not remain stable over time.", 
	"I am interested in comprehensive care to achieve and maintain a higher level of dental health.
I am concerned about treating the causes of dental diseases, not simply the effects.
I want all dental treatment provided to be the best available for maximum protection and longevity, so as to achieve long-term
stable dental health.", 
	"I am interested in comprehensive and cosmetic care to achieve and maintain the highest level of dental health. I am concerned about treating the causes of dental diseases, not simply the effects. I want all dental treatment provided to be the best available in cosmetic dentistry for maximum protection, longevity, and esthetics, so as to achieve long-term stable, yet esthetic, dental health."
  ]
end
def medical_conditons
t = [
	"Allergies/Hay Fever",
	"Diabetes",
	"Heart Surgery",
    "Rheumatic Fever",	
	"Anemia", 
	"Epilepsy or Seizures", 
	"Hepatitis",
	"Rheumatism", 
	"Angina", "Excessive Thirst", "High Blood Pressure", "Sickle Cell Disease", "Arthritis", "Fainting or Dizziness", "HIV*/AIDS", "Sinus Problems", "Artificial Joints", "Fever Blisters/Cold Sores", "Kidney Problems", "Stroke", "Artificial Heart Valves*", "Fequent Cough", "Liver Problems", "Surgical Shunt*", "Asthma", "Glaucoma", "Mental Disorders", "Thyroid Problems", "Breathing Problems", "Heart Disorder (Congenital)*", "Mitral Valve Prolapse*", "Tuberculosis", "Cancer", "Heart Infection*", "Osteoporosis", "Ulcers", "Chemical Dependency", "Heart Murmur", "Radiation Treatment", "Venereal Disease", "Chemotherapy", "Heart Pace Maker*", "Respiratory Problems", "Yellow Jaundice"	
]
return t
end

def appointment_consent
return " 
We value your time so you can expect us to see you at the appointed time and to keep your time spent in our office as short as possible. In return, when you make an appointment with us please be on time since we have reserved our time just for you.
Please make every effort not to change your scheduled appointment. If you must change an appointment, please provide us at
least <b>2 working days advanced notification</b> so that we may use our time to accommodate other patients. Broken and missed
appointments create scheduling problems for other patients and our practice. We value your time, please value ours.

"
end
def doc_name
 return "Dr. Buehler"
end

end
