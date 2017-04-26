xquery version "3.0";

module namespace spirograaf="http://mansoft.nl/xquery/spirograaf";
declare namespace spiro="http://mansoft.nl/spiro";
declare namespace line="http://mansoft.nl/line"; 
declare namespace svg="http://www.w3.org/2000/svg";
declare namespace math="http://www.w3.org/2005/xpath-functions/math";

declare variable $spirograaf:colors as element(colors) :=
    <colors>
        <color dutch="rood" english="red"/>
        <color dutch="groen" english="green"/>
        <color dutch="blauw" english="blue"/>
        <color dutch="zwart" english="black"/>
    </colors>
    ;

declare function spirograaf:gcd($m as xs:integer, $n as xs:integer) as xs:integer {
    if ($m mod $n eq 0) then ($n) else (spirograaf:gcd($n, $m mod $n))
};

declare function spirograaf:points($spirodoc as document-node()) as element(line:line)* {
    let $aa as xs:double := 6.47059e-2
        , $bb as xs:double := 0.31e0
        , $rr as xs:double := 3.05e0
        , $figuur as element(spiro:figuur) := $spirodoc/spiro:figuur
        , $ring as xs:integer := xs:integer($figuur/@ring)
    return
        for $wiel as element(spiro:wiel) in $figuur/spiro:wiel
            let $tanden as xs:integer := xs:integer($wiel/@tanden)
                , $gat as xs:integer := xs:integer($wiel/@gat)
                , $startpos as xs:integer := xs:integer($wiel/@ringtand)
                , $factor as xs:double := 2.0 * math:pi() div $ring
                , $cs as xs:double := math:cos($factor * $startpos)
                , $sn as xs:double := math:sin($factor * $startpos)
                , $ggdringwiel := spirograaf:gcd($ring, $tanden)
                , $wr as xs:decimal := $tanden div $ring
                , $a as xs:decimal := 1.0 - $wr
                , $b as xs:double := $wr - ($aa * ($gat - 1.0) + $bb) div $rr
                , $kleur as xs:string := xs:string($wiel/@kleur)
                , $color as xs:string := xs:string($spirograaf:colors/color[@dutch eq $kleur]/@english)
            return
                <line xmlns="http://mansoft.nl/line" color="{$color}">
                {
                    for $t1 in (0 to xs:integer($tanden div $ggdringwiel * 100))
                            let $t as xs:double :=  $t1 div 100 * math:pi() * 2.0
                                , $x as xs:double := $a * math:cos($t) + $b * math:cos($t - $t div $wr)
                                , $y as xs:double := $a * math:sin($t) + $b * math:sin($t - $t div $wr)
                                , $plot_x as xs:double := $cs * $x + $sn * $y
                                , $plot_y as xs:double := -$sn * $x + $cs * $y 
                            return <point x="{$plot_x}" y="{$plot_y}"/>
                }
                </line>
};

declare function spirograaf:points-to-svg($spiros as element(line:line)*) as element(svg:svg) {
    let $polylines as element(svg:polyline)* :=
        for $spiro as element(line:line) in $spiros
            let $points as xs:string* :=
                for $point as element(line:point) in $spiro/line:point
                    return concat($point/@x, ',', $point/@y)
                , $svg-points as xs:string := string-join($points, ' ')
            return
                <polyline xmlns="http://www.w3.org/2000/svg" fill="none" stroke="{$spiro/@color}" stroke-width="0.006" points="{$svg-points}"/>
    return
        <svg xmlns="http://www.w3.org/2000/svg" width="100%" height="100%" viewBox="-1.0 -1.0 2.0 2.0">
        {
            $polylines
        }
        </svg>
}; 
