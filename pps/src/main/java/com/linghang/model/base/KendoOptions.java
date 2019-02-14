package com.linghang.model.base;

import java.util.List;
import java.util.Map;
import java.util.Objects;

/**
 * @author
 */
public class KendoOptions {

    private Integer page;
    private Integer pageSize;
    private Integer skip;
    private Integer take;

    private List<Map<String, String>> sort;

    private List<Map<String, String>> filters;

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public Integer getSkip() {
        return skip;
    }

    public void setSkip(Integer skip) {
        this.skip = skip;
    }

    public Integer getTake() {
        return take;
    }

    public void setTake(Integer take) {
        this.take = take;
    }

    public List<Map<String, String>> getSort() {
        return sort;
    }

    public void setSort(List<Map<String, String>> sort) {
        this.sort = sort;
    }

    public List<Map<String, String>> getFilters() {
        return filters;
    }

    public void setFilters(List<Map<String, String>> filters) {
        this.filters = filters;
    }

    @Override
    public String toString() {
        return "KendoOptions{" +
                "page=" + page +
                ", pageSize=" + pageSize +
                ", skip=" + skip +
                ", take=" + take +
//                ", filter=" + filter +
                ", sort=" + sort +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        KendoOptions that = (KendoOptions) o;
        return Objects.equals(page, that.page) &&
                Objects.equals(pageSize, that.pageSize) &&
                Objects.equals(skip, that.skip) &&
                Objects.equals(take, that.take) &&
                Objects.equals(filters, that.filters) &&
                Objects.equals(sort, that.sort);
    }

    @Override
    public int hashCode() {

        return Objects.hash(page, pageSize, skip, take, filters, sort);
    }
}
