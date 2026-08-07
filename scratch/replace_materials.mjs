import { createClient } from '@supabase/supabase-js';

const SUPABASE_URL = 'https://cylnczofknwcunxhifiy.supabase.co';
const SUPABASE_ANON_KEY = 'sb_publishable_c27Qh-Zn0H_mBAd1lqK-6Q_j6x9d6o6';

const supabase = createClient(SUPABASE_URL, SUPABASE_ANON_KEY);

const rawQuestions = `
Q: Which of the following is classified as a synthetic solid material manufactured by humans? A: Clay B: Wood C: Plastic D: Diamond Answer: C Explanation: According to the curriculum text, materials can be natural (such as wood, clay, or stone) or synthetic (such as plastics or ceramics) [171, 172]. Plastic is a synthetic solid manufactured through chemical processes, while clay, wood, and diamond are natural solids [171, 172, 185]. Difficulty: easy Bloom: recall

Q: A student collected water, palm wine, 'sobolo', cooking oil, and vinegar from the local market. Under which state of matter should all these substances be classified? A: Solids B: Liquids C: Gases D: Semi-metals Answer: B Explanation: Water, palm wine, 'sobolo', cooking oil, and vinegar all flow, have a definite volume, and take the shape of their containing vessels, which are defining properties of liquids [4, 174, 176]. Difficulty: easy Bloom: understand

Q: Which of the following groups of materials consists entirely of gases found in our environment? A: Water vapour, Oxygen, Carbon dioxide B: Oxygen, Nitrogen, Dettol C: Carbon dioxide, Helium, Petrol D: Air, Steam, Sobolo Answer: A Explanation: Water vapour, oxygen, and carbon dioxide are completely in the gaseous state [4, 174]. Dettol, petrol, and sobolo are liquids, meaning options B, C, and D contain liquids [4]. Difficulty: medium Bloom: understand

Q: Under normal conditions, a block of brick maintains its shape when transferred from a plastic bucket into a wooden box. Why does it do so? A: Its particles have extremely high kinetic energy. B: The intermolecular forces of attraction between its particles are very weak. C: Its particles are closely packed in a regular pattern and held by strong forces. D: Its particles are highly mobile and slide past each other. Answer: C Explanation: Solids like brick have a fixed shape and volume because their particles are closely packed in a regular pattern with strong intermolecular forces of attraction holding them in fixed positions [5, 174, 178]. Difficulty: medium Bloom: understand

Q: A student pours 100 mL of milk from a circular glass cup into a rectangular plastic container. What will happen to the shape and volume of the milk? A: Both the shape and volume of the milk will change. B: The shape of the milk will change to rectangular, but its volume will remain 100 mL. C: The shape of the milk remains circular, but its volume changes to fill the container. D: Neither the shape nor the volume of the milk will change. Answer: B Explanation: Liquids have a definite volume but no fixed shape [178]. They flow and take the shape of their container [176]. Therefore, the shape changes to match the rectangular container, but the volume remains exactly 100 mL [4, 176]. Difficulty: medium Bloom: apply

Q: Which state of matter has no definite shape and no definite volume, expanding rapidly to fill any available container space? A: Solid B: Liquid C: Gas D: Semi-solid Answer: C Explanation: Gases do not have a definite shape or volume and expand to fill any available space because their particles are widely spaced with extremely weak attractive forces, moving freely in all directions [5, 177, 179]. Difficulty: easy Bloom: recall

Q: Why is it very easy to squeeze or compress gas inside a bicycle tyre, while it is virtually impossible to compress a solid iron bar? A: Gas particles are larger in size than solid particles. B: There are large empty spaces between gas particles, whereas solid particles are tightly packed. C: Solid particles vibrate too fast to be compressed. D: Gas particles have much lower kinetic energy than solid particles. Answer: B Explanation: Gases are highly compressible because their particles are far apart with empty spaces between them, allowing them to be squeezed closer [181, 182, 188]. Solids cannot be compressed easily because their particles are already closely packed together [5, 6, 181]. Difficulty: hard Bloom: analyze

Q: Which of the following statements correctly describes the motion of particles in a solid substance? A: They move rapidly and randomly in all directions. B: They slide over each other independently from one point to another. C: They vibrate in fixed positions and cannot move about freely. D: They expand and contract dynamically in size. Answer: C Explanation: Particles in a solid are held together by very strong bonds in a fixed pattern [5, 174]. They cannot move about freely and can only vibrate about their mean or fixed positions [5, 174]. Difficulty: medium Bloom: understand

Q: When a bottle of local perfume is opened at the front of a JHS 1 classroom, students at the back of the classroom soon smell the perfume. What property of gases explains this observation? A: Gases have high density and settle quickly. B: Gas particles move rapidly and freely to fill the available space. C: Gas particles are locked in a regular rigid pattern. D: Gases have very low kinetic energy. Answer: B Explanation: Gas particles have a lot of energy and move rapidly in all directions [177]. They are not bound together, allowing them to move freely and independently to fill the entire space available through diffusion [177, 179]. Difficulty: hard Bloom: apply

Q: Which of the following lists the three states of matter in order of INCREASING intermolecular forces of attraction (from the weakest forces to the strongest forces)? A: Solid < Liquid < Gas B: Gas < Liquid < Solid C: Liquid < Gas < Solid D: Gas < Solid < Liquid Answer: B Explanation: The intermolecular forces of attraction are very weak in gases, moderately stronger in liquids, and very strong in solids [6, 181]. Thus, the order of increasing force is Gas < Liquid < Solid [6, 181]. Difficulty: hard Bloom: analyze

Q: If you wave a dry piece of paper across your face, you will feel a cooling sensation on your skin. What does this simple activity demonstrate? A: That the paper is undergoing sublimation. B: The physical presence of invisible air in our environment. C: That air is a compound made of hydrogen and oxygen. D: That air is highly compressible under low pressure. Answer: B Explanation: As noted in Activity 2 under Indicator B7.1.1.1.1, waving a piece of paper across your face allows you to feel the physical presence of air, which is otherwise invisible [8, 9]. Difficulty: easy Bloom: understand

Q: Which of the following substances can coexist in all three physical states of matter (solid, liquid, and gas) under normal conditions on Earth? A: Iron B: Water C: Carbon dioxide D: Kerosene Answer: B Explanation: Water is a unique substance that naturally exists in all three states of matter: solid (ice), liquid (water), and gas (water vapour/steam) within standard Earth temperatures and pressures [3, 4, 187]. Difficulty: easy Bloom: recall

Q: In which state of matter do particles possess the HIGHEST kinetic energy (movement energy)? A: Solid B: Liquid C: Gas D: All states have equal kinetic energy. Answer: C Explanation: Particles in a gaseous state have the highest kinetic energy, allowing them to break completely free from attractive forces and move rapidly in all directions [5, 6, 177, 178]. Difficulty: medium Bloom: understand

Q: Which of the following properties is common to BOTH liquids and gases? A: They both have a fixed volume. B: They both have a definite shape. C: They are both capable of flowing and taking the shape of their container. D: They both have tightly packed particles in a regular pattern. Answer: C Explanation: Both liquids and gases are classified as fluids because they flow [5, 176, 177]. Neither has a fixed shape, and both take the shape of their containing vessels [4, 5, 180]. Difficulty: medium Bloom: analyze

Q: Why is it highly difficult to compress solid materials such as wood or stone? A: Their particles are too small to be compressed. B: Their particles are already tightly packed with negligible empty space between them. C: Their particles repel each other violently. D: Their particles have too much kinetic energy. Answer: B Explanation: Solids are generally incompressible because their particles are closely packed together in a highly dense, rigid arrangement with almost no space between them to compress [5, 6, 181]. Difficulty: hard Bloom: understand

Q: Which of the following statements explains why water is biologically critical for human digestion? A: It turns red litmus paper to blue. B: It helps break down food, absorb nutrients, and move waste through the digestive tract. C: It provides the body with mineral calcium for bone development. D: It functions as a highly concentrated antiseptic solution. Answer: B Explanation: According to the text, water plays a crucial role in the digestion process by helping to break down food, facilitating the absorption of nutrients, and aiding the smooth movement of food through the digestive system [183]. Difficulty: medium Bloom: understand

Q: A doctor prescribes 'Gentian violet' to a child in a community in Ghana. What is the primary medical importance of this liquid solid-solution? A: It is used as a household disinfectant to clean tables. B: It is used to treat fungal infections of the skin and prevent infection on minor cuts. C: It provides essential sodium nutrients to prevent dehydration. D: It is used as engine lubrication in local mills. Answer: B Explanation: Gentian violet is an important medicinal liquid used to treat fungal skin infections and is applied on minor cuts and scrapes to prevent bacterial infection [8]. Difficulty: easy Bloom: recall

Q: How does the liquid disinfectant 'Dettol' protect humans against illnesses in Ghanaian homes? A: It acts as a nutrient that provides calories for active metabolism. B: It functions as an antiseptic solution that kills harmful bacteria and germs. C: It reacts with water to form essential minerals like calcium. D: It is used to preserve fresh fish from spoiling during transport. Answer: B Explanation: Dettol is an effective concentrated antiseptic solution that kills bacteria and provides protection against germs which can cause infection and illness on the skin or household surfaces [8]. Difficulty: easy Bloom: recall

Q: What is 'dry ice' scientifically, and why is it highly valued in the agricultural transportation sector? A: It is frozen water used to keep fish wet. B: It is solid carbon dioxide used to keep food cold and prevent spoiling during transit. C: It is solid nitrogen used as a crop fertilizer. D: It is frozen table salt used as a preservative. Answer: B Explanation: Dry ice is solid (frozen) carbon dioxide [9, 185]. It is highly useful in food and agriculture to preserve food items by keeping them cold during transportation without leaving liquid residue [9, 10, 186]. Difficulty: medium Bloom: understand

Q: Dry ice is placed in a damaged, non-functioning refrigerator in a village. How does it help preserve the contents inside? A: It melts into liquid water to hydrate the food. B: It releases oxygen gas to stimulate bacterial growth. C: It maintains extremely cold temperatures to stop food decay. D: It reacts chemically with the plastic shelves of the fridge. Answer: C Explanation: Dry ice is solid carbon dioxide, which is exceptionally cold [9, 185]. In broken or damaged refrigerators, it is used to keep the contents cold and prevent spoilage [10, 186]. Difficulty: medium Bloom: apply

Q: A fishmonger at a coastal market in Accra packs fresh fish in layers of table salt ($ ext{NaCl}$). What is the scientific reason for doing this? A: The salt turns the fish into a liquid state. B: Salt provides a highly saline environment in which bacteria cannot easily survive and multiply. C: Salt conducts electricity to freeze the fish. D: Salt provides vitamin D to prevent rickets in fish. Answer: B Explanation: Table salt ($ ext{NaCl}$) acts as a highly effective food preservative because harmful bacteria cannot thrive or multiply in the presence of high salt concentrations, preventing spoilage [187]. Difficulty: medium Bloom: apply

Q: Why does the human body require small, regular amounts of the solid nutrient table salt ($ ext{NaCl}$)? A: To provide the body with immediate energy for physical work. B: To conduct nerve impulses, contract muscles, and maintain fluid balance. C: To build antibodies that fight malaria. D: To act as a catalyst for protein digestion in the mouth. Answer: B Explanation: According to the curriculum text, the human body requires a small amount of sodium (from table salt) to conduct nerve impulses, contract and relax muscles, and maintain the proper balance of water and minerals [187]. Difficulty: medium Bloom: understand

Q: An empty plastic mineral water bottle is tightly capped and pushed down into a bucket of water. When released, it pops back up and bubbles are seen if opened. What does this demonstrate? A: That water has no definite mass. B: That the empty bottle actually contains air, which occupies space and exerts pressure. C: That plastics always dissolve in water. D: That water vapour is denser than liquid water. Answer: B Explanation: This experiment demonstrates that air is everywhere and occupies space [8, 9]. Pushing the 'empty' bottle into water shows resistance because the air inside occupies space and prevents water from fully entering [8]. Difficulty: hard Bloom: evaluate

Q: The periodic table lists Hydrogen as the very first element. What is the correct chemical symbol for Hydrogen? A: Hy B: H C: He D: Hg Answer: B Explanation: The chemical symbol for Hydrogen is a single capital letter 'H' [13, 195]. 'He' is Helium, and 'Hg' is Mercury [13, 195, 196]. Difficulty: easy Bloom: recall

Q: What is the correct chemical symbol for Helium, the second element in the periodic table? A: H B: He C: Hl D: Ha Answer: B Explanation: The chemical symbol for Helium is 'He' [13, 195]. The first letter must be written in capital letters and the second letter in small letters [12, 194]. Difficulty: easy Bloom: recall

Q: The element Lithium has the atomic number 3. What is its chemical symbol? A: L B: Li C: Lt D: La Answer: B Explanation: The correct chemical symbol for Lithium is 'Li' [13, 195]. Single letter symbols like 'L' do not represent Lithium [13, 195]. Difficulty: easy Bloom: recall

Q: Which of the following is the correct chemical symbol for the element Beryllium (atomic number 4)? A: B B: By C: Be D: Br Answer: C Explanation: The chemical symbol for Beryllium is 'Be' [13, 195]. 'B' represents Boron [13, 195]. Difficulty: easy Bloom: recall

Q: Boron is a metalloid with atomic number 5. What is the correct symbol for Boron? A: Bo B: Br C: B D: Be Answer: C Explanation: The correct chemical symbol for Boron is a single capital letter 'B' [13, 195]. Difficulty: easy Bloom: recall

Q: What is the correct chemical symbol for Carbon (atomic number 6)? A: Ca B: Cr C: C D: Co Answer: C Explanation: The chemical symbol for Carbon is 'C' [13, 195]. 'Ca' represents Calcium [14, 195]. Difficulty: easy Bloom: recall

Q: Which of the following chemical symbols represents Nitrogen (atomic number 7)? A: Ni B: Nt C: Na D: N Answer: D Explanation: The symbol for Nitrogen is 'N' [14, 195]. 'Na' represents Sodium [13, 194, 195]. Difficulty: easy Bloom: recall

Q: Oxygen is crucial for respiration in humans. What is its chemical symbol? A: Ox B: O C: Op D: Og Answer: B Explanation: The chemical symbol for Oxygen is 'O' [14, 195]. Difficulty: easy Bloom: recall

Q: Fluorine is element number 9 on the periodic table. What is its correct symbol? A: Fl B: F C: Fr D: Fe Answer: B Explanation: The symbol for Fluorine is a single capital letter 'F' [14, 195]. 'Fe' is the chemical symbol for Iron [196, 285]. Difficulty: easy Bloom: recall

Q: What is the correct chemical symbol for Neon (atomic number 10)? A: N B: No C: Ne D: Na Answer: C Explanation: The chemical symbol for Neon is 'Ne' [14, 195]. 'N' is Nitrogen and 'Na' is Sodium [14, 195]. Difficulty: easy Bloom: recall

Q: The chemical symbol for Sodium is derived from its Latin name. What is this Latin name? A: Kalium B: Natrium C: Ferrum D: Aurum Answer: B Explanation: Sodium's chemical symbol is Na, which is derived from its Latin name Natrium [13, 170, 194]. Kalium is the Latin name for Potassium (K) [13, 170]. Difficulty: medium Bloom: recall

Q: Which of the following is the correct chemical symbol for Sodium? A: S B: So C: Na D: Sd Answer: C Explanation: The chemical symbol for Sodium is 'Na' [13, 195]. 'S' is the symbol for Sulphur [14, 195]. Difficulty: easy Bloom: recall

Q: What is the correct chemical symbol for Magnesium (atomic number 12)? A: M B: Mg C: Mn D: Ma Answer: B Explanation: The chemical symbol for Magnesium is 'Mg' [14, 195]. 'Mn' represents Manganese [196, 285]. Difficulty: easy Bloom: recall

Q: Aluminium is a highly malleable metal with atomic number 13. What is its chemical symbol? A: A B: Am C: Al D: Au Answer: C Explanation: The correct symbol for Aluminium is 'Al' [14, 195]. 'Au' represents Gold [13, 195, 196]. Difficulty: easy Bloom: recall

Q: Silicon is a semi-metal widely used in microchips. What is its chemical symbol? A: S B: Si C: Sl D: Sc Answer: B Explanation: The chemical symbol for Silicon is 'Si' [14, 195]. 'S' is the symbol for Sulphur [14, 195]. Difficulty: easy Bloom: recall

Q: What is the correct chemical symbol for Phosphorus (atomic number 15)? A: Ph B: Po C: P D: Pr Answer: C Explanation: The correct symbol for Phosphorus is a single capital letter 'P' [14, 195]. Difficulty: easy Bloom: recall

Q: Sulphur has the atomic number 16. What is its chemical symbol? A: Su B: Sl C: S D: Sf Answer: C Explanation: The chemical symbol for Sulphur is 'S' [14, 195]. Difficulty: easy Bloom: recall

Q: Chlorine is a halogen used in water purification. What is its chemical symbol? A: C B: Ch C: Cl D: Cr Answer: C Explanation: The symbol for Chlorine is 'Cl' [14, 195]. Carbon is 'C' [13, 195]. Difficulty: easy Bloom: recall

Q: What is the correct chemical symbol for Argon (atomic number 18)? A: A B: Ar C: An D: Ag Answer: B Explanation: The symbol for Argon is 'Ar' [14, 195]. 'Ag' represents Silver [196, 285]. Difficulty: easy Bloom: recall

Q: The chemical symbol for Potassium is derived from its Latin name. What is this Latin name? A: Natrium B: Kalium C: Aurum D: Plumbum Answer: B Explanation: Potassium's chemical symbol is K, which is derived from its Latin name Kalium [13, 170, 194]. Natrium is the Latin name for Sodium (Na) [13, 170]. Difficulty: medium Bloom: recall

Q: Which of the following is the correct chemical symbol for Potassium? A: P B: Po C: K D: Pt Answer: C Explanation: The chemical symbol for Potassium is 'K' [13, 195]. 'P' represents Phosphorus [14, 195]. Difficulty: easy Bloom: recall

Q: Calcium is element number 20 on the periodic table. What is its chemical symbol? A: C B: Cl C: Ca D: Cu Answer: C Explanation: The symbol for Calcium is 'Ca' [14, 195]. 'Cu' represents Copper [196, 285]. Difficulty: easy Bloom: recall

Q: When writing chemical symbols with two letters, what is the correct formatting rule? A: Both letters must be written in capital letters. B: Both letters must be written in lowercase letters. C: The first letter is capitalized, and the second letter is in lowercase. D: The first letter is in lowercase, and the second letter is capitalized. Answer: C Explanation: If an element's chemical symbol has two letters, the first letter is always written in capital (uppercase) and the second letter is written in small (lowercase) [12, 194]. E.g. 'He', 'Li', 'Na' [13, 195]. Difficulty: medium Bloom: understand

Q: A student wants to classify the element Magnesium ($ ext{Mg}$). Under which category should it be placed? A: Non-metal B: Metal C: Noble gas D: Semi-metal Answer: B Explanation: Magnesium ($ ext{Mg}$) is an alkaline earth metal found in Group 2, on the left side of the periodic table [15, 201]. Therefore, it is classified as a metal [201]. Difficulty: easy Bloom: recall

Q: Elements that are shiny, malleable, ductile, and excellent conductors of both heat and electricity are classified as: A: Non-metals B: Semi-metals C: Metals D: Noble gases Answer: C Explanation: Malleability, ductility, high melting points, high density, and good thermal/electrical conductivity are characteristic properties of metals [17, 201]. Difficulty: medium Bloom: understand

Q: Which of the following is a characteristic property of non-metals? A: They can be easily drawn into fine wires (ductile). B: They are shiny with high metallic luster. C: They are generally poor conductors of heat and electricity. D: They have very high melting and boiling points. Answer: C Explanation: Non-metals are generally poor conductors of heat and electricity because they lack free electrons [19, 203]. They are also brittle and not ductile [19, 203, 204]. Difficulty: medium Bloom: understand

Q: Why is graphite (a form of Carbon) considered an EXCEPTIONAL non-metal? A: It has extremely high density. B: It is a good conductor of heat and electricity. C: It is highly malleable and can be beaten into shapes. D: It reacts aggressively with water. Answer: B Explanation: Carbon is a non-metal, and non-metals are poor conductors of electricity [19, 203]. However, Carbon in the form of graphite is an exception because it is a good conductor of heat and electricity [19, 203]. Difficulty: hard Bloom: analyze

Q: A JHS 1 student dropped a crystal of purple potassium permanganate into water and observed it spreading slowly. In a different experiment, she sprayed perfume in the air, and the scent spread almost instantly. What does this show about the rate of diffusion in liquids compared to gases? A: Diffusion is faster in liquids than in gases. B: Diffusion is faster in gases than in liquids. C: Diffusion occurs at the same speed in both liquids and gases. D: Solids can diffuse faster than liquids and gases combined. Answer: B Explanation: Diffusion is the movement of particles from a region of higher concentration to a region of lower concentration [362]. It is millions of times faster in gases than in liquids because gas particles have higher kinetic energy and are extremely far apart, moving rapidly and freely [153, 154, 158]. Difficulty: medium Bloom: analyze

Q: When water in a beaker is heated, what happens to the motion of the water molecules as the temperature increases? A: The molecules slow down and eventually stop moving. B: The molecules gain kinetic energy and move or vibrate more vigorously. C: The molecules shrink in size and pack tightly together. D: The molecules lose their energy and turn into a solid state. Answer: B Explanation: Heating a substance increases its thermal energy, which is directly related to the movement of its molecules [31, 49, 154]. When heated, molecules gain kinetic energy and move or vibrate more rapidly and vigorously [40, 41, 151, 154]. Difficulty: medium Bloom: understand

Q: Why does a solid block of wood have multiple free surfaces, while a gas inside a closed container has no free surface at all? A: Gas particles are too heavy to form surfaces. B: Gas particles have extremely weak binding forces and expand to fill any available space in all directions. C: Solid particles can flow easily to create surfaces. D: Solid particles have no intermolecular forces. Answer: B Explanation: Solid substances maintain their shape and have multiple free surfaces because their particles are held in fixed positions [3, 4, 151]. Gases have no free surface because their intermolecular forces are extremely weak, and their particles move rapidly and randomly in all directions to completely fill any containing vessel [4, 153, 155, 157]. Difficulty: hard Bloom: analyze

Q: How do the intermolecular forces of attraction between particles in liquid water compare to the forces between particles in solid ice? A: The forces in liquid water are stronger than in ice. B: The forces in liquid water are weaker than in ice, allowing particles to slide past each other. C: There are no forces of attraction in either liquid water or ice. D: The forces are identical in strength in both states. Answer: B Explanation: Particles in liquid water are quite closely packed, but the intermolecular forces of attraction between them are weaker than those in solid ice [4, 5, 152]. This gives liquid particles more freedom to move past each other independently [5, 151, 152]. Difficulty: medium Bloom: understand

Q: Solid rocks do not flow, but liquid river water flows easily. What is the particle-level explanation for why liquids can flow while solids cannot? A: Solid particles are larger than liquid particles. B: Liquid particles can slide past each other due to weaker intermolecular forces, while solid particles are locked in fixed positions. C: Liquid particles are tightly bound in a regular, rigid pattern. D: Solid particles possess higher kinetic energy than liquid particles. Answer: B Explanation: Solids maintain their shape and do not flow because their particles are tightly packed in a regular, fixed pattern with strong forces preventing them from moving past each other [150, 151]. Liquids flow because their particles are not in a fixed arrangement and have weaker forces, allowing them to slide over one another [151, 152]. Difficulty: hard Bloom: analyze

Q: A student sketches a diagram representing the particle arrangement of liquid milk. Which of the following correctly describes how she should draw the particles? A: Tightly packed in a highly ordered, regular grid pattern. B: Very far apart with massive empty spaces, moving in straight lines. C: Close together but arranged randomly with no ordered, regular pattern. D: Completely stationary and touching only at the bottom of the container. Answer: C Explanation: In a liquid, particles are still close together (though not as tightly packed as in a solid) but they are not arranged in any regular, ordered pattern [151, 156]. This allows them to slide and flow [151, 152]. Difficulty: medium Bloom: understand

Q: It is extremely easy to compress air inside a syringe by pushing the plunger. However, if the syringe is filled with water, it is almost impossible to push the plunger. Why are liquids not easily compressed compared to gases? A: Liquid particles have no kinetic energy. B: The particles in a liquid are already very close together with very little empty space between them. C: Liquid particles repel each other much more than gas particles. D: Liquid water has a fixed shape that resists any volume change. Answer: B Explanation: Gases are highly compressible because their particles are widely spaced with large empty gaps between them [153, 157, 158]. Liquids are generally not easily compressible because their particles are already close together, meaning there is very little empty space to squeeze them closer [151, 157]. Difficulty: hard Bloom: analyze

Q: According to the JHS science curriculum, what is the scientific definition of a 'material'? A: Anything that can be seen, touched, or measured. B: A substance or mixture of substances that constitutes an object. C: Only synthetic items manufactured by humans in factories. D: A chemical substance made of atoms of only one kind. Answer: B Explanation: The curriculum defines a material as "a substance or mixture of substances that constitute an object" [2]. A "substance" is anything that can be seen, touched, or measured [2]. Difficulty: medium Bloom: recall

Q: Why do solid objects, such as JHS metal chairs or wooden desks, have a definite and fixed volume? A: Because their particles can easily expand to fill any room. B: Because their particles are held tightly in fixed positions by strong intermolecular forces and cannot move about freely. C: Because their particles are in constant, rapid, and random motion. D: Because they have a lower density than liquids and gases. Answer: B Explanation: Solids have a definite shape and fixed volume because their particles are tightly packed in a regular pattern and held in fixed positions by strong attractive forces, preventing them from moving about freely [5, 150, 151]. Difficulty: medium Bloom: understand

Q: When an ice block melts into liquid water, what major structural change occurs in its particle arrangement? A: The closely packed, ordered particles break free from their fixed pattern and become randomly arranged while remaining close. B: The particles separate from each other completely and scatter in all directions. C: The particles grow larger in physical size and stop vibrating. D: The particles lose all of their kinetic energy and lock into place. Answer: A Explanation: When a solid melts, the heat causes its particles to vibrate so vigorously that they break free from their fixed, regular pattern [40, 150]. They rearrange randomly, sliding past each other as a liquid while still remaining relatively close [151, 152, 156]. Difficulty: hard Bloom: analyze

Q: A student compares the density of ice, liquid water, and steam (water vapour). In general, why are solids and liquids much denser than gases of the same substance? A: Solid and liquid particles are much larger in physical size than gas particles. B: Solids and liquids have their particles closely packed together, meaning there is more mass per unit volume. C: Gas particles are too light to have any mass. D: Liquid and gas particles possess more mass than solid particles. Answer: B Explanation: Density is a measure of how tightly matter is packed [158]. Solids and liquids are much denser than gases because their particles are closely packed together, whereas gas particles are widely scattered with huge empty spaces between them [150, 151, 153, 158]. Difficulty: medium Bloom: understand

Q: When a JHS student inflates a balloon, the gas completely fills the balloon's volume. Why do gases expand to fill any available container? A: Their particles are stationary and swell in size. B: Their particles have high kinetic energy and extremely weak binding forces, allowing them to move freely and independently in all directions. C: They have a regular arrangement that expands outwards. D: Their particles are attracted to the rubber of the balloon. Answer: B Explanation: Gases do not have a definite shape or volume because their particles have high kinetic energy and extremely weak intermolecular forces, allowing them to move rapidly and freely to fill whatever container space is available [153, 157]. Difficulty: medium Bloom: understand

Q: Aside from solids, liquids, and gases, what is the fourth state of matter that is described as super-heated matter or ionized gas? A: Colloid B: Suspension C: Plasma D: Solution Answer: C Explanation: The JHS textbook notes that apart from the three common states of matter (solids, liquids, gases), a fourth state of matter called plasma exists, which is defined as super-heated matter or ionized gas [254]. Difficulty: medium Bloom: recall

Q: Which of the following statements correctly describes how particles move in a gaseous substance like oxygen? A: They vibrate in fixed positions and do not change location. B: They slide slowly and smoothly past each other in one direction. C: They move rapidly and randomly in all directions, constantly colliding. D: They only move when pushed by an external wind or force. Answer: C Explanation: In a gas, particles have high kinetic energy and move rapidly, freely, and randomly in all directions [153, 156, 157]. They are in constant motion and collide with each other and the container walls [153, 156, 164]. Difficulty: easy Bloom: understand

Q: A liquid has one free surface (the top surface), but a gas inside a closed flask has no free surface. What property of gas particles accounts for this? A: Gas particles are too small to have a surface. B: Gas particles have zero mass and do not experience gravity. C: Gas particles move freely and fill the entire space of the flask, leaving no boundary. D: Gas particles are held tightly by gravitational forces. Answer: C Explanation: Because gas particles are widely spread and have extremely weak attractive forces, they move rapidly in all directions and expand to fill the entire container available to them [4, 153]. Consequently, they do not settle or form a free surface like liquids do [4, 153, 155]. Difficulty: hard Bloom: analyze
`;

const parsedQuestions = [];
const blocks = rawQuestions.trim().split(/\n\s*\n/);

for (const block of blocks) {
  // Extract parts using regex
  const match = block.match(/Q:\s*(.*?)\s+A:\s*(.*?)\s+B:\s*(.*?)\s+C:\s*(.*?)\s+D:\s*(.*?)\s+Answer:\s*([A-D])\s+Explanation:\s*(.*?)\s+Difficulty:\s*(.*?)\s+Bloom:\s*(.*)/i);
  if (match) {
    const [_, q, a, b, c, d, ans, exp, diff, bloom] = match;
    const options = [a, b, c, d];
    const correctIndex = ans.toUpperCase().charCodeAt(0) - 65; // 'A' -> 0, 'B' -> 1...
    
    parsedQuestions.push({
      question_type: 'multiple_choice',
      stem: q,
      options: options,
      correct_answer: [options[correctIndex]],
      explanation: exp,
      difficulty: diff.toLowerCase() === 'hard' ? 'bece_level' : (diff.toLowerCase() === 'medium' ? 'core' : 'easy'),
      blooms_level: bloom.toLowerCase() === 'understand' ? 'recall' : (bloom.toLowerCase() === 'apply' ? 'application' : (bloom.toLowerCase() === 'analyze' ? 'analysis' : 'recall')), // simplify
      visibility: 'shared',
      hints: []
    });
  } else {
    console.warn("Failed to parse block:", block.substring(0, 50));
  }
}

async function main() {
  const { data: authData, error: authError } = await supabase.auth.signInWithPassword({
    email: 'eli@flawlex.online',
    password: 'Sacramento'
  });

  if (authError) {
    console.error('Login failed:', authError.message);
    process.exit(1);
  }
  
  const teacherId = authData.user.id;
  const topic1 = "40ff1749-9c4f-5cc2-84b9-d569aff7e8d5";
  const topic2 = "f1eff29f-f670-5cb9-9af8-22bc8ed7becc";
  
  console.log('Deleting existing questions for both topics...');
  await supabase.from('questions').delete().in('topic_id', [topic1, topic2]);

  console.log(`Parsed ${parsedQuestions.length} questions to insert.`);
  
  const inserts = parsedQuestions.map(q => ({
    ...q,
    topic_id: topic1, // just put them all in the first topic
    owner_teacher_id: teacherId
  }));
  
  const { data, error } = await supabase.from('questions').insert(inserts);
  
  if (error) {
    console.error('Insert error:', error);
  } else {
    console.log('Successfully inserted all new questions!');
  }
}

main();
