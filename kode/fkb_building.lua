out = {}

for i, indent, tokens in tokens, info, 0 do
    if tokens[1] == "FLATE" then
		-- out["type"] = "multipolygon"
        -- out["type"] = "building"
    elseif tokens[1] == "OBJTYPE" then
		if tokens[2] == "Takkant" then
			out["building"]="yes"
            out["height"]="7" 
            out["roof:height"]="1.57"
        elseif tokens[2] == "Mønelinje" then
            out["roof:ridge"]="yes"
        elseif tokens[2] == "Bygningslinje" then
            out["roof:edge"]="yes"
        elseif tokens[2] == "Taksprang" then
            out["roof:edge"]="yes"
        elseif tokens[2] == "Grunnmur" then
            out["building"]="foundation"
        elseif tokens[2] == "TaksprangBunn" then
            out["roof:edge"]="yes"
        elseif tokens[2] == "Veranda" then
            out["balcony"]="yes"
        else
            out[tokens[1]] = tokens[2]
		end
    elseif tokens[1] == "BYGGTYP_NBR" then
        if tokens[2] == "181" or tokens[2] == "182" then
            out["building"] = "garage"
        elseif tokens[2] == "111" or tokens[2] == "112" or tokens[2] == "141" then
            out["building"] = "detached"
        elseif tokens[2] == "121" or tokens[2] == "123" or tokens[2] == "131" or tokens[2] == "122" or tokens[2] == "133" or tokens[2] == "136" then
            out["building"] = "house"
        elseif tokens[2] == "135" or tokens[2] == "142" or tokens[2] == "143" or tokens[2] == "144" or tokens[2] == "145" or tokens[2] == "146" then
            out["building"] = "appartment"
        elseif tokens[2] == "239" or tokens[2] == "231" then
            out["building"] = "warehouse"
        elseif tokens[2] == "161" then
            out["building"] = "cabin"
        elseif tokens[2] == "241" then
            out["building"] = "farm_auxiliary"
        elseif tokens[2] == "241" then
            out["building"] = "farm_auxiliary"
        elseif tokens[2] == "249" then
            out["building"] = "agricultural"
        elseif tokens[2] == "113" then
            out["building"] = "farm"
        elseif tokens[2] == "223" then
            out["building"] = "substation"
        elseif tokens[2] == "319" then
            out["building"] = "office"
        elseif tokens[2] == "322" or tokens[2] == "329" then
            out["building"] = "commercial"
        elseif tokens[2] == "612" then
            out["building"] = "kindegarten"
        elseif tokens[2] == "183" then
            out["building"] = "boathouse"
        elseif tokens[2] == "152" then
            out["building"] = "dormitory"
        elseif tokens[2] == "219" then
            out["building"] = "industrial"
        elseif tokens[2] == "212" then
            out["building"] = "service"
        elseif tokens[2] == "613" or tokens[2] == "619" then
            out["building"] = "school"
        elseif tokens[2] == "243" then
            out["building"] = "greenhouse"
        elseif tokens[2] == "659" then
            out["building"] = "sports_hall"
        elseif tokens[2] == "211" then
            out["building"] = "factory"
        elseif tokens[2] == "531" then
            out["building"] = "restaurant"
        elseif tokens[2] == "311" then
            out["building"] = "office"
        else 
            ut["building"] = "yes"
        end
    elseif tokens[1] == "" then
        out["width"] = tokens[2]
    elseif tokens[1] == "OPPDATERINGSDATO" then
        out["source:date"] = tokens[2]
    elseif tokens[1] == "DATAFANGSTDATO" then
        out["source:date"] = tokens[2]            
    elseif tokens[1] == "NAVN" then
        out["name"] = tokens[2]
    elseif #tokens == 2 then
        out[tokens[1]] = tokens[2]
    elseif #tokens > 2 then
        out[tokens[1]] = table.concat(tokens, "; ", 2)
    end
end

return out