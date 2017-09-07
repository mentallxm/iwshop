<div style="margin: 0 10px;">
    {include file="./cat_brands_list.tpl"}
</div>
{foreach from=$products item=pd}
    <section class="productListWrap hoz" onclick="location = '{$docroot}?/vProduct/view/id={$pd.product_id}&showwxpaytitle=1';">
        <a class="productList{if $stype ne 'hoz'} clearfix{/if}">
            <img src="{$pd.catimg}@1e_1c_0o_0l_200h_200w_90q.src" />
            <section>
                <title class="title">{$pd.product_name}</title>
                <span class='prices'>&yen;{$pd.sale_prices}</span>
            </section>
        </a>
    </section>
{/foreach}