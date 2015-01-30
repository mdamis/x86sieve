section		.data

section		.text
		global _init_tab:
		global _crible:
		
		
_init_tab:
		push ebp
		mov ebp, esp
		push ebx
		push edx

		mov eax, [ebp+8]
		mov ebx, [ebp+12]
		mov ecx, 0
		mov edx, 0

		; eax : adresse du premier element
		; ebx : taille du tableau n
		; ecx : compteur
		; edx : 0 ou 1

		mov [eax], edx
		inc ecx
		inc eax
		mov [eax], edx
		mov edx, 1
		inc ecx

bcle_init:
		cmp ecx, ebx ; on regarde si on a atteint la fin du tableau
		jg fin
		inc eax
		mov [eax], edx
		inc ecx
		jmp bcle_init



_crible:
		push ebp
		mov ebp, esp
		push ebx
		push edx

		mov eax, [ebp+8] ; adresse du premier element
		mov ebx, [ebp+12] ; taille du tableau n
		add ebx, eax ; adresse du dernier element
		mov ecx, 1 ; i
		mov edx, 0


bcle_crible:
		inc ecx ; on augmente i
		mov eax, [ebp+8] ; on se replace sur le premier element
		add eax, ecx ; on se decale au i-eme element
		cmp eax, ebx ; on regarde si on a atteint la fin
		jge fin ; si oui, on termine
		cmp [eax], edx ; on regarde si tab[i] == 0
		jz bcle_crible ; si oui, on passe au i suivant

calcul:
		add eax, ecx ; "multiplication", on ajoute i a eax
		cmp eax, ebx ; on regarde si on a i * k > n
		jge bcle_crible ; si oui, on retourne dans la boucle principale
		mov[eax], edx ; sinon, on met tab[i*k] a 0
		jmp calcul ; on continue dans la boucle

		
fin:
		pop edx
		pop ebx
		pop ebp
		ret
