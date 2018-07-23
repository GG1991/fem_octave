%
%  This source code is part of FEM_octave: a set of simple finite 
%  element codes to check results.
%
%  Copyright (C) - 2018 - Guido Giuntoli <gagiuntoli@gmail.com>
%
%  This program is free software: you can redistribute it and/or modify
%  it under the terms of the GNU General Public License as published by
%  the Free Software Foundation, either version 3 of the License, or
%  (at your option) any later version.
%
%  This program is distributed in the hope that it will be useful,
%  but WITHOUT ANY WARRANTY; without even the implied warranty of
%  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%  GNU General Public License for more details.
%
%  You should have received a copy of the GNU General Public License
%  along with this program.  If not, see <https://www.gnu.org/licenses/>.
%

npe = 4;
ngp = 4;
dim = 2;

xg = [ -0.577350269189626, -0.577350269189626;
       +0.577350269189626, -0.577350269189626;
       +0.577350269189626, +0.577350269189626;
       -0.577350269189626, +0.577350269189626 ];

dsh = zeros(npe, dim, ngp);

for gp = 1 : ngp
 dsh(1,:,gp) = [-1 * (1 - xg(gp,2)) , -1 * (1 - xg(gp,1))];
 dsh(2,:,gp) = [+1 * (1 - xg(gp,2)) , -1 * (1 + xg(gp,1))];
 dsh(3,:,gp) = [+1 * (1 + xg(gp,2)) , +1 * (1 + xg(gp,1))];
 dsh(4,:,gp) = [-1 * (1 + xg(gp,2)) , +1 * (1 - xg(gp,1))];
end

Ae = zeros(4,4);

for gp = 1 : ngp
 for i = 1 : npe
  for j = 1 : npe
   for k = 1 : dim
    Ae(i, j) += dsh(i, k, gp) * dsh(j, k, gp);
   end
  end
 end
end

Ae

%------------------------------------------------------------

npe = 8;
ngp = 8;
dim = 3;

xg = [ -0.577350269189626, -0.577350269189626, -0.577350269189626;
       +0.577350269189626, -0.577350269189626, -0.577350269189626;
       +0.577350269189626, +0.577350269189626, -0.577350269189626;
       -0.577350269189626, +0.577350269189626, -0.577350269189626;
       -0.577350269189626, -0.577350269189626, +0.577350269189626;
       +0.577350269189626, -0.577350269189626, +0.577350269189626;
       +0.577350269189626, +0.577350269189626, +0.577350269189626;
       -0.577350269189626, +0.577350269189626, +0.577350269189626 ];

dsh = zeros(npe, dim, ngp);

for gp = 1 : ngp
 dsh(1,:,gp) = [-1 * (1 - xg(gp,2)) * (1 - xg(gp,3)) , -1 * (1 - xg(gp,1)) * (1 - xg(gp,3)), -1 * (1 - xg(gp,1)) * (1 - xg(gp,2))];
 dsh(2,:,gp) = [+1 * (1 - xg(gp,2)) * (1 - xg(gp,3)) , -1 * (1 + xg(gp,1)) * (1 - xg(gp,3)), -1 * (1 + xg(gp,1)) * (1 - xg(gp,2))];
 dsh(3,:,gp) = [+1 * (1 + xg(gp,2)) * (1 - xg(gp,3)) , +1 * (1 + xg(gp,1)) * (1 - xg(gp,3)), -1 * (1 + xg(gp,1)) * (1 + xg(gp,2))];
 dsh(4,:,gp) = [-1 * (1 + xg(gp,2)) * (1 - xg(gp,3)) , +1 * (1 - xg(gp,1)) * (1 - xg(gp,3)), -1 * (1 - xg(gp,1)) * (1 + xg(gp,2))];
 dsh(5,:,gp) = [-1 * (1 - xg(gp,2)) * (1 + xg(gp,3)) , -1 * (1 - xg(gp,1)) * (1 + xg(gp,3)), +1 * (1 - xg(gp,1)) * (1 - xg(gp,2))];
 dsh(6,:,gp) = [+1 * (1 - xg(gp,2)) * (1 + xg(gp,3)) , -1 * (1 + xg(gp,1)) * (1 + xg(gp,3)), +1 * (1 + xg(gp,1)) * (1 - xg(gp,2))];
 dsh(7,:,gp) = [+1 * (1 + xg(gp,2)) * (1 + xg(gp,3)) , +1 * (1 + xg(gp,1)) * (1 + xg(gp,3)), +1 * (1 + xg(gp,1)) * (1 + xg(gp,2))];
 dsh(8,:,gp) = [-1 * (1 + xg(gp,2)) * (1 + xg(gp,3)) , +1 * (1 - xg(gp,1)) * (1 + xg(gp,3)), +1 * (1 - xg(gp,1)) * (1 + xg(gp,2))];
end

Ae = zeros(8,8);

for gp = 1 : ngp
 for i = 1 : npe
  for j = 1 : npe
   for k = 1 : dim
    Ae(i, j) += dsh(i, k, gp) * dsh(j, k, gp);
   end
  end
 end
end

Ae
