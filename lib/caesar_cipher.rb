# FONCTION pour trouver si un caractère est une MAJ ou une minuscule
def maj_or_not(letter)
    if letter.ord >= 97 && letter.ord <= 122
        return 1 # minuscule
    elsif letter.ord >= 65 && letter.ord <= 90
        return -1 # MAJUSCULE
    else return 0
    end
end

# FONCTION pour décaler une lettre donnée d'un certain nombre de caractère
def decal_1_lettre(letter,nb)
    if maj_or_not(letter) == 1 # si la lettre testée est une minuscule
        if letter.ord + nb <= 122 # si on ne dépasse pas le "z" 
            new_letter = (letter.ord + nb).chr
        elsif (letter.ord + nb) > 122
            new_letter = ((((letter.ord + nb) - 96) % 26) + 96).chr
        end
    elsif maj_or_not(letter) == -1 # si la lettre testée est une MAJUSCULE
        if letter.ord + nb <= 90
            new_letter = (letter.ord + nb).chr
        elsif (letter.ord + nb) > 90
             new_letter = ((((letter.ord + nb) - 64) % 26)+64).chr
        end
    end
    return new_letter
end

# FONCTION pour prendre un string en entrée et lui appliquer lettre par lettre la fonction de décalage
# en faisant attention aux caractères spéciaux 

def caesar_cipher(string,nb_decal=0)
    exceptions = ["!", ".", "?", " "]
    tab_mot = string.chars

    tab_lettres = []
    tab_mot.map! do |lettre|
        unless exceptions.include? lettre #si mon caractère n'est pas dans les exceptions
            new_l = decal_1_lettre(lettre, nb_decal).chr # on la décale en appliquant la fonction vue précédemment
            tab_lettres.push new_l # on l'ajoute au tableau de lettres
        else # sinon, s'il figure parmis les exceptions
            tab_lettres.push lettre # on l'ajoute au tableau sans la décaler
        end
    end
    return tab_lettres.join
    
end

puts caesar_cipher("What a string!", 31)
