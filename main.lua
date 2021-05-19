menu = {}
menu.title = "Bassem"
menu.title2 = "Tk78"

sound = love.audio.newSource("sound/sound.wav", "static")
sound2 = love.audio.newSource("sound/sound2.wav", "static")
sound3 = love.audio.newSource("sound/sound3.wav", "static")
sound:setVolume(0.5)
sound2:setVolume(0.7)
sound3:setVolume(0.7)
pad = {}
pad.x = 0
pad.y = 0
pad.largeur = 20
pad.hauteur = 80

pad2 = {}
pad2.x = 800 - pad.largeur
pad2.y = 300 - pad.hauteur
pad2.largeur = 20
pad2.hauteur = 80

SepareLigne = {}
SepareLigne.x = 400
SepareLigne.y = 300
SepareLigne.largeur = 10
SepareLigne.hauteur = 800

balle = {}
balle.x = 400
balle.y = 300
balle.largeur = 20
balle.hauteur = 20
balle.vitesse_x = 1
balle.vitesse_y = 1

score_joueur1 = 0
score_joueur2 = 0


SepareLigne.x = love.graphics.getWidth()/2 - SepareLigne.largeur/2
SepareLigne.y = love.graphics.getWidth()/2 - SepareLigne.hauteur/2

function CentreBalle()
  balle.x = love.graphics.getWidth()/2 - balle.largeur/2
  balle.y = love.graphics.getHeight()/2 - balle.hauteur/2
  balle.vitesse_x = 1
  balle.vitesse_y = 1
  
end




function love.load()
  CentreBalle()
end

function love.update(dt)
  --raquette1
  if love.keyboard.isDown("down") and pad.y < love.graphics.getHeight() - pad.hauteur then
    pad.y = pad.y + 1
  elseif love.keyboard.isDown("up") and pad.y > 0 then
    pad.y = pad.y - 1
  end
  if love.keyboard.isDown("a") and pad2.y < love.graphics.getHeight() - pad2.hauteur then
    pad2.y = pad2.y + 1
  elseif love.keyboard.isDown("e") and pad2.y > 0 then
    pad2.y = pad2.y - 1
  end
  balle.x = balle.x + balle.vitesse_x
  balle.y = balle.y + balle.vitesse_y 
  
  if balle.y > love.graphics.getHeight() - balle.hauteur then
    balle.vitesse_y = -balle.vitesse_y
    love.audio.play(sound3)
  elseif balle.y < 0 then
    balle.vitesse_y = -balle.vitesse_y
    love.audio.play(sound3)
  elseif balle.x > love.graphics.getWidth() - balle.hauteur then
    CentreBalle()
    score_joueur1 = score_joueur1 + 1
    love.audio.play(sound)
  elseif balle.x < 0 then
    CentreBalle()
    score_joueur2 = score_joueur2 + 1
    love.audio.play(sound2)
  end
  if balle.x <= pad.x + pad.largeur then
    if balle.y + balle.hauteur > pad.y and balle.y < pad.y + pad.hauteur then
      balle.vitesse_x = -balle.vitesse_x
      balle.x = pad.x + pad.largeur
    end
  end
  --raquette2
  if balle.x + balle.largeur > pad2.x then
    if balle.y + balle.hauteur > pad2.y and balle.y < pad2.y + pad2.hauteur then
      balle.vitesse_x = -balle.vitesse_x
    end
  end
    
end


function love.draw()
  love.graphics.print(menu.title,310,250)
  love.graphics.print(menu.title2,450,250)
  love.graphics.rectangle("fill",pad.x,pad.y,pad.largeur,pad.hauteur)
  love.graphics.rectangle("fill",pad2.x,pad2.y,pad2.largeur,pad2.hauteur)
  
  love.graphics.rectangle("fill",SepareLigne.x,SepareLigne.y,SepareLigne.largeur,SepareLigne.hauteur)
  
  love.graphics.rectangle("fill",balle.x,balle.y,balle.largeur,balle.hauteur)
  
  love.graphics.print("score joueur1: "..score_joueur1,290,0)
  love.graphics.print("score joueur2: "..score_joueur2,410,0)
end
