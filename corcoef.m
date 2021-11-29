function [r] = corcoef(x,y)
%correlaciona la posición de los centros reales
%con los centros detectados


xp = x - mean(x); 
yp = y - mean(y);

r = (xp*yp)/(norm(xp)*norm(yp));

end

