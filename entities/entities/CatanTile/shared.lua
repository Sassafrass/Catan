
ENT.Type = "anim"
ENT.Base = "base_anim"

ENT.Edges = {}
ENT.Corners = {}

function ENT:SetupDataTables()
	self:DTVar( "Int", 0, "X" )
	self:DTVar( "Int", 1, "Y" )
	self:DTVar( "Int", 2, "TerrainType" )
	self:DTVar( "Entity", 0, "Board" )
end

function ENT:GetTerrain()
	return self.dt.TerrainType
end

function ENT:GetX()
	return self.dt.X
end

function ENT:GetY()
	return self.dt.Y
end

function ENT:GetBoard()
	return self.dt.Board
end
function ENT:GetEdges()

	local edges = {}
	edges[ "UP" ] = self:GetUPEdge()
	edges[ "DN" ] = self:GetDNEdge()
	edges[ "LL" ] = self:GetLLEdge()
	edges[ "UL" ] = self:GetULEdge()
	edges[ "LR" ] = self:GetLREdge()
	edges[ "UR" ] = self:GetUREdge()
	
	return edges
	
end

function ENT:GetVertexs()
	
	local vertexs = {}
	vertexs[ "UL" ] = self:GetULVertex()
	vertexs[ "UR" ] = self:GetURVertex()
	vertexs[ "RT" ] = self:GetRTVertex()
	vertexs[ "LT" ] = self:GetLTVertex()
	vertexs[ "LL" ] = self:GetLLVertex()
	vertexs[ "LR" ] = self:GetLRVertex()
	
	return vertexs
	
end

function ENT:SetDiceValue( value )
	self.DiceValue = value
end

function ENT:GetDiceValue()
	return self.DiceValue
end

function ENT:HasRobber()
	return self:GetBoard():GetRobber():GetTile() == self
end

function ENT:GetAdjacentTiles()
	
	local adjacentTiles = {}
	adjacentTiles[ "UP" ] = self:GetUP()
	adjacentTiles[ "DN" ] = self:GetDN()
	adjacentTiles[ "LL" ] = self:GetLL()
	adjacentTiles[ "UL" ] = self:GetUL()
	adjacentTiles[ "LR" ] = self:GetLR()
	adjacentTiles[ "UR" ] = self:GetUR()
	
	return adjacentTiles
	
end

function ENT:GetULVertex()
	return self:GetBoard():GetVertexAt( self:GetX() - 1, self:GetY() * 2 )
end

function ENT:GetURVertex()
	return self:GetBoard():GetVertexAt( self:GetX(), self:GetY() * 2 + 1 )
end

function ENT:GetRTVertex()
	return self:GetBoard():GetVertexAt( self:GetX() + 1, self:GetY() * 2 )
end

function ENT:GetLTVertex()
	return self:GetBoard():GetVertexAt( self:GetX() - 1, self:GetY() * 2 - 1 )
end

function ENT:GetLLVertex()
	return self:GetBoard():GetVertexAt( self:GetX() - 1, self:GetY() * 2 - 2 )
end

function ENT:GetLRVertex()
	return self:GetBoard():GetVertexAt( self:GetX(), self:GetY() * 2 - 1 )
end

function ENT:GetDN()
	return self:GetBoard():GetTileAt( self:GetX(), self:GetY() - 1 )
end

function ENT:GetUP()
	return self:GetBoard():GetTileAt( self:GetX(), self:GetY() + 1 )
end

function ENT:GetLL()
	return self:GetBoard():GetTileAt( self:GetX() - 1, self:GetY() - 1 )
end

function ENT:GetUL()
	return self:GetBoard():GetTileAt( self:GetX() - 1, self:GetY() )
end

function ENT:GetLR()
	return self:GetBoard():GetTileAt( self:GetX() + 1, self:GetY() )
end

function ENT:GetUR()
	return self:GetBoard():GetTileAt( self:GetX() + 1, self:GetY() + 1 )
end