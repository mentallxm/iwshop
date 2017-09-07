{strip}{if $pdloaded ne 0}
        {foreach from=$serials item=serial}
            {if $serial.pdCount > 0}
                {if !$serial.s and $serial.serial_name ne '' and $serial.serial_name ne '默认'}
                    <header class="serialCaption {$stype}"><span>{$serial.serial_name}</span></header>
                {/if}
                <div class="clearfix pdBlock">
                    {foreach from=$serial.pd item=pd}
                        <section class="productListWrap {$stype} {if $serial.s}patch{/if}" onclick="location = '{$docroot}?/vProduct/view/id={$pd.product_id}&showwxpaytitle=1';">
                            <a class="productList{if $stype ne 'hoz'} clearfix{/if}">
                                <img src="{$pd.catimg}@1e_1c_0o_0l_250h_250w_90q.src" />
                                <section>
                                    <title class="title">{$pd.product_name}</title>
                                    <span class='prices'>&yen;{$pd.sale_prices}{if $pd.market_price neq ''}<i>&yen;{$pd.market_price}</i>{/if}</span>
                                </section>
                            </a>
                        </section>
                    {/foreach}
                </div>
            {/if}
        {/foreach}
{else}0{/if}{/strip}